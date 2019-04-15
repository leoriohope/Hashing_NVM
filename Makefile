  
CC		= g++
CFLAGS	= -std=c++17 -I./ -lrt -lpthread -O3
MODULES = $(shell ls src/*.cpp | grep -v -F test | sed -e 's/src\///g' | sed -e 's/.cpp/.o/g')
TEST 	= $(shell ls src/*_test.cpp | sed -e 's/src\///g' | sed -e 's/.cpp//g')

.PRECIOUS: %.o

all: $(TEST)

%.o: src/%.cpp src/*.h
	$(CC) -c -o $@ $< $(CFLAGS)

%: %.o $(MODULES)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm $(TEST) *.o