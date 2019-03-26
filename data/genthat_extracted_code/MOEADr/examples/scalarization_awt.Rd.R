library(MOEADr)


### Name: scalarization_awt
### Title: Adjusted Weighted Tchebycheff Scalarization
### Aliases: scalarization_awt

### ** Examples

W    <- generate_weights(decomp = list(name = "sld", H = 19), m = 2)
Y    <- matrix(runif(40), ncol = 2)
minP <- apply(Y, 2, min)
Z    <- scalarization_awt(Y, W, minP)




