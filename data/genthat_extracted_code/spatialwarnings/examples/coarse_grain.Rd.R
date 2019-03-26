library(spatialwarnings)


### Name: coarse_grain
### Title: Matrix coarse-graining
### Aliases: coarse_grain

### ** Examples

rmat <- matrix(runif(20*10) > .5, 
               ncol = 20, nrow = 10)
rmat.cg <- coarse_grain(rmat, subsize = 2)

par(mfrow = c(1, 2))
image(rmat)
title('Raw matrix') 
image(rmat.cg) 
title('Coarse-grained matrix')




