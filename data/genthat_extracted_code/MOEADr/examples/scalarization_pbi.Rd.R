library(MOEADr)


### Name: scalarization_pbi
### Title: Penalty-based Boundary Intersection Scalarization
### Aliases: scalarization_pbi

### ** Examples

W      <- generate_weights(decomp = list(name = "sld", H = 19), m = 2)
Y      <- matrix(runif(40), ncol = 2)
minP   <- apply(Y, 2, min)
aggfun <- aggfun    <- list(name = "pbi", theta = 5)
Z      <- scalarization_pbi(Y, W, minP, aggfun)




