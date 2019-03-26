library(rdetools)


### Name: rbfkernel
### Title: Calculate RBF kernel matrix
### Aliases: rbfkernel
### Keywords: models

### ** Examples

## generate sinc data and calculate rbf kernel matrix with sigma = 1
d <- sincdata(100, noise = 0.1)
K <- rbfkernel(d$X)



