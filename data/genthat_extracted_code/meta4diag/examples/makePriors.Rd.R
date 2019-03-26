library(meta4diag)


### Name: makePriors
### Title: Priors for internal use.
### Aliases: makePriors

### ** Examples

## Not run: 
##D if(requireNamespace("INLA", quietly = TRUE)){
##D require("INLA", quietly = TRUE)
##D makePriors(var.prior = "PC", cor.prior = "PC", var.par = c(3, 0.05), 
##D   cor.par = c(1, -0.1, 0.5, -0.95, 0.05, NA, NA))
##D makePriors(var.prior = "PC", cor.prior = "PC", var.par = c(3, 0.05), 
##D   cor.par = c(2, -0.1, 0.5, NA, NA, 0.95, 0.05))
##D makePriors(var.prior = "PC", cor.prior = "PC", var.par = c(3, 0.05), 
##D   cor.par = c(3, -0.1, NA, -0.95, 0.05, 0.95, 0.05))
##D makePriors(var.prior = "invgamma", cor.prior = "normal", 
##D   var.par = c(0.25, 0.025), cor.par = c(0, 5))
##D makePriors(var.prior = "invwishart", wishart.par=c(4,1,2,0.1))
##D }
## End(Not run)



