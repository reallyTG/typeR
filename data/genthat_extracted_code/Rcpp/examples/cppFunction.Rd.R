library(Rcpp)


### Name: cppFunction
### Title: Define an R Function with a C++ Implementation
### Aliases: cppFunction

### ** Examples

## Not run: 
##D 
##D cppFunction(
##D     'int fibonacci(const int x) {
##D         if (x == 0) return(0); 
##D         if (x == 1) return(1);
##D         return (fibonacci(x - 1)) + fibonacci(x - 2);
##D     }')
##D 
##D cppFunction(depends = "RcppArmadillo",
##D     'List fastLm(NumericVector yr, NumericMatrix Xr) {
##D         
##D         int n = Xr.nrow(), k = Xr.ncol();
##D         
##D         arma::mat X(Xr.begin(), n, k, false); 
##D         arma::colvec y(yr.begin(), yr.size(), false);
##D         
##D         arma::colvec coef = arma::solve(X, y);
##D         arma::colvec resid = y - X*coef;
##D         
##D         double sig2 = arma::as_scalar(arma::trans(resid)*resid/(n-k) );
##D         arma::colvec stderrest = arma::sqrt(
##D             sig2 * arma::diagvec(arma::inv(arma::trans(X)*X)));
##D         
##D         return List::create(Named("coefficients") = coef,
##D             Named("stderr")       = stderrest
##D         );
##D     }')
##D     
##D cppFunction(plugins=c("cpp11"), '
##D     int useCpp11() {
##D         auto x = 10;
##D         return x;
##D     }')
##D     
## End(Not run)



