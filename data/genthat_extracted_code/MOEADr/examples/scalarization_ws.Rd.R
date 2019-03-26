library(MOEADr)


### Name: scalarization_ws
### Title: Weighted Sum Scalarization
### Aliases: scalarization_ws

### ** Examples

W    <- generate_weights(decomp = list(name = "sld", H = 19), m = 2)
Y    <- matrix(runif(40), ncol = 2)
minP <- apply(Y, 2, min)
Z    <- scalarization_ws(Y, W, minP)




