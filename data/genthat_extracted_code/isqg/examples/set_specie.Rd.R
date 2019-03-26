library(isqg)


### Name: set_specie
### Title: Constructor of Instances of the Specie Class
### Aliases: set_specie

### ** Examples

data(ToyMap)
spc_standard <- set_specie(ToyMap)

## generate standard _de novo_ variability
spc_standard$gamete(n = 100)

## Not run: 
##D ## writing your own meiosis process and using it
##D Meiosis <- '
##D // [[Rcpp::plugins(cpp11)]]
##D // [[Rcpp::depends(BH, isqg)]] 
##D # include <isqg.h> // loading headers of the package
##D 
##D // half w/ crossing at position 1.0
##D Map meiosis(const double & i, const double & j) {
##D 
##D   if (static_cast<bool>(R::rbinom(1.0, 0.5))) {
##D     return Map() ;
##D   } else {
##D     return Map(1, 1.0) ;
##D   }
##D 
##D }
##D 
##D // wrap the function as external pointer
##D // [[Rcpp::export]]
##D MPtr myMeiosis() { return MPtr(new FPtrM(& meiosis), true) ; }
##D '
##D 
##D ## compile the code
##D Rcpp::sourceCpp(code = Meiosis, rebuild = TRUE)
##D 
##D ## define a specie w/ custom meiosis
##D spp_custom <- set_specie(ToyMap, meiosis = myMeiosis())
##D 
##D ## check meiosis process
##D spp_custom$gamete(n = 100)
## End(Not run)




