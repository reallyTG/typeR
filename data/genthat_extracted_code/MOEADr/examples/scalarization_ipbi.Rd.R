library(MOEADr)


### Name: scalarization_ipbi
### Title: Inverted Penalty-based Boundary Intersection Scalarization
### Aliases: scalarization_ipbi

### ** Examples

W      <- generate_weights(decomp = list(name = "sld", H = 19), m = 2)
Y      <- matrix(runif(40), ncol = 2)
minP   <- apply(Y, 2, min)
aggfun <- aggfun    <- list(name = "ipbi", theta = 5)
Z      <- scalarization_ipbi(Y, W, minP, aggfun)




