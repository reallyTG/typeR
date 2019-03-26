library(Rcpp)


### Name: exportAttribute
### Title: Rcpp::export Attribute
### Aliases: exportAttribute

### ** Examples

## Not run: 
##D 
##D #include <Rcpp.h>
##D 
##D using namespace Rcpp;
##D 
##D // [[Rcpp::export]]
##D int fibonacci(const int x) {
##D 
##D    if (x == 0) return(0);
##D    if (x == 1) return(1);
##D    
##D    return (fibonacci(x - 1)) + fibonacci(x - 2);
##D }
##D 
##D // [[Rcpp::export("convolveCpp")]]
##D NumericVector convolve(NumericVector a, NumericVector b) {
##D 
##D    int na = a.size(), nb = b.size();
##D    int nab = na + nb - 1;
##D    NumericVector xab(nab);
##D     
##D    for (int i = 0; i < na; i++)
##D       for (int j = 0; j < nb; j++)
##D          xab[i + j] += a[i] * b[j];
##D     
##D    return xab;
##D }
## End(Not run)



