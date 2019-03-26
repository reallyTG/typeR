library(inline)


### Name: cxxfunction
### Title: inline C++ function
### Aliases: cxxfunction rcpp
### Keywords: programming interface

### ** Examples

## Not run: 
##D 
##D # default plugin
##D fx <- cxxfunction( signature(x = "integer", y = "numeric" ) , '
##D 	return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;
##D ' )
##D fx( 2L, 5 )
##D 
##D # Rcpp plugin
##D if( require( Rcpp ) ){
##D 
##D 	fx <- cxxfunction( signature(x = "integer", y = "numeric" ) , '
##D 		return wrap( as<int>(x) * as<double>(y) ) ;
##D 	', plugin = "Rcpp" )
##D 	fx( 2L, 5 )
##D 
##D         ## equivalent shorter form using rcpp()
##D 	fx <- rcpp(signature(x = "integer", y = "numeric"),
##D                    ' return wrap( as<int>(x) * as<double>(y) ) ; ')
##D 
##D }
##D 
##D # RcppArmadillo plugin
##D if( require( RcppArmadillo ) ){
##D 	
##D 	fx <- cxxfunction( signature(x = "integer", y = "numeric" ) , '
##D 		int dim = as<int>( x ) ;
##D 		arma::mat z = as<double>(y) * arma::eye<arma::mat>( dim, dim ) ;
##D 		return wrap( arma::accu(z) ) ;
##D 	', plugin = "RcppArmadillo" )
##D 	fx( 2L, 5 )
##D 	
##D 	
##D }
##D 
## End(Not run)



