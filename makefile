CC=g++
NAME=main

SEP=\\


SOURCEDIR=src$(SEP)
HEADERDIR=headers$(SEP)
INCLUDESDIR=includes$(SEP)¨

OBJ=obj$(SEP)
BIN=bin$(SEP)
LIB=lib$(SEP)
DISTR=distr$(SEP)

SOURCES=MaClasse.cpp
OBJS=$(SOURCES:%.cpp=%.o)
PATHOBJS=$(OBJS:%=$(OBJ)%)
WARNINGS=-Wall -Wextra -pedantic -ansi

LIBS=

FLAGS= $(WARNINGS) -I$(HEADERDIR) -I$(INCLUDESDIR) -L$(LIB)

all: $(OBJS) main.o
	$(CC) $(FLAGS) -o $(BIN)$(NAME).exe -static $(OBJ)main.o $(OBJS:%=$(OBJ)%) $(LIBS)

main.o:
	$(CC) -g $(FLAGS) -c main.cpp -o $(OBJ)main.o -static

%.o: 
	$(CC) -g $(FLAGS) -c $(SOURCEDIR)$(@:%.o=%.cpp) -o $(OBJ)$@ -static

share: $(OBJS)
	ar -rcs $(DISTR)$(NAME).a $(OBJS:%=$(OBJ)%)