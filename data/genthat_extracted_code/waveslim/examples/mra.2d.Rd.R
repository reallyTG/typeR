library(waveslim)


### Name: mra.2d
### Title: Multiresolution Analysis of an Image
### Aliases: mra.2d
### Keywords: ts

### ** Examples

## Easy check to see if it works...
## --------------------------------

x <- matrix(rnorm(32*32), 32, 32)
# MODWT
x.mra <- mra.2d(x, method="modwt")
x.mra.sum <- x.mra[[1]]
for(j in 2:length(x.mra))
  x.mra.sum <- x.mra.sum + x.mra[[j]]
sum((x - x.mra.sum)^2)

# DWT
x.mra <- mra.2d(x, method="dwt")
x.mra.sum <- x.mra[[1]]
for(j in 2:length(x.mra))
  x.mra.sum <- x.mra.sum + x.mra[[j]]
sum((x - x.mra.sum)^2)



