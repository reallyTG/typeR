library(lolog)


### Name: inlineLologPlugin
### Title: An lolog plug-in for easy C++ prototyping and access
### Aliases: inlineLologPlugin inlineLologPlugin

### ** Examples

## Not run: 
##D # This creates a function in C++ to create an empty network of size n
##D # and expose it to R.
##D src <- "
##D lolog::BinaryNet<lolog::Directed> makeEmptyNetwork(const int n){
##D Rcpp::IntegerMatrix tmp(0,2);
##D lolog::BinaryNet<lolog::Directed> net(tmp, n);
##D return net;
##D }
##D "
##D Rcpp::registerPlugin("lolog",inlineLologPlugin)
##D emptyNetwork <- cppFunction(src,plugin="lolog")
##D net <- emptyNetwork(10L)
##D net[1:10,1:10]
##D 
## End(Not run)



