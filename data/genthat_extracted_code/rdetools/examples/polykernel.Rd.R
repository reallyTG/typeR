library(rdetools)


### Name: polykernel
### Title: Calculate polynomial kernel matrix
### Aliases: polykernel
### Keywords: models

### ** Examples

## generate sinc data and calculate polynomial kernel matrix with d = 5
d <- sincdata(100, noise = 0.1)
K <- polykernel(d$X, 5)



