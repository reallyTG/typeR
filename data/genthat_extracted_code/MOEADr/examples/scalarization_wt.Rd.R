library(MOEADr)


### Name: scalarization_wt
### Title: Weighted Tchebycheff Scalarization
### Aliases: scalarization_wt

### ** Examples

W    <- generate_weights(decomp = list(name = "sld", H = 19), m = 2)
Y    <- matrix(runif(40), ncol = 2)
minP <- apply(Y, 2, min)
Z    <- scalarization_wt(Y, W, minP)




