library(Rcpp)


### Name: sourceCpp
### Title: Source C++ Code from a File or String
### Aliases: sourceCpp

### ** Examples

## Not run: 
##D 
##D sourceCpp("fibonacci.cpp")
##D 
##D sourceCpp(code='
##D   #include <Rcpp.h>
##D 
##D   // [[Rcpp::export]]
##D   int fibonacci(const int x) {
##D     if (x == 0) return(0);
##D     if (x == 1) return(1);
##D     return (fibonacci(x - 1)) + fibonacci(x - 2);
##D   }'
##D )
##D 
## End(Not run)



