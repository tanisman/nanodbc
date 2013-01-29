all:
	# Example build for clang++ using iODBC on OS X
	clang++ example.cpp nanodbc.cpp -o example $(iodbc-config --libs) -Wall -Wno-deprecated-declarations ${ODBC_FLAGS}

cpp11:
	# Example build for clang++ with C++11 using iODBC on OS X
	clang++ example.cpp nanodbc.cpp -o example $(iodbc-config --libs) -Wall -Wno-deprecated-declarations ${ODBC_FLAGS} -std=c++11 -stdlib=libc++ -DNANODBC_USE_CPP11

clean:
	rm -rf a.out.dSYM a.out example

dox:
	make clean
	find doc -type f -not -name header.html -and -not -name footer.html | xargs rm 
	doxygen
