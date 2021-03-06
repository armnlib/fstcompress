.SUFFIXES :

.SUFFIXES : .ftn90 .c .o

SHELL = /bin/sh

CPP = /lib/cpp

# RMNLIB = $(ARMNLIB)/lib/$(EC_ARCH)$(ABI)/librmn.a
RMNLIB =

FFLAGS =  

CFLAGS = 

DEFINE = -defines =-DFICHSTD98
#
#OPTIMIZ = -O 0 -debug
OPTIMIZ = -O 2
$(info OPTIMIZ is ${OPTIMIZ})

VER_C = 307
VER_U = 306

LIBRMN = 

default: fstcompress fstuncompress

.ftn90.o:
	s.compile -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<

.c.o:
	s.compile -abi $(ABI) $(DEFINE) $(OPTIMIZ) -includes "$(CPPFLAGS)" -optc "=$(CFLAGS)" -src $<

OBJET =

fstcompress: fstcompress.o $(OBJET)
	s.compile -o fstcompress_$(VER_C)-$(BASE_ARCH) -obj fstcompress.o $(OBJET) -librmn $(LIBRMN)

fstcompress+: fstcompress.o $(OBJET)
	s.compile -o fstcompress+ -obj fstcompress.o $(OBJET) -librmn rmnbeta

fstuncompress: fstuncompress.o $(OBJET) 
	s.compile -o fstuncompress_$(VER_U)-$(BASE_ARCH) -obj fstuncompress.o $(OBJET) -librmn $(LIBRMN)

fstuncompress+: fstuncompress.o $(OBJET) 
	s.compile -o fstuncompress+ -obj fstuncompress.o $(OBJET) -librmn rmnbeta

clean:
	  \rm -f *.o *.f90 *.stb *.f *_*-$(BASE_ARCH) 

