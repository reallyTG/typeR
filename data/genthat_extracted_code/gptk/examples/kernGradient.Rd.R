library(gptk)


### Name: kernGradient
### Title: Compute the gradient wrt the kernel parameters.
### Aliases: kernGradient cmpndKernGradient disimKernGradient
###   disimXdisimKernGradient disimXrbfKernGradient disimXsimKernGradient
###   mlpKernGradient multiKernGradient rbfKernGradient simKernGradient
###   simXrbfKernGradient simXsimKernGradient translateKernGradient
###   whiteKernGradient whiteXwhiteKernGradient
### Keywords: model

### ** Examples

kern <- kernCreate(1, 'rbf')
g <- kernGradient(kern, as.matrix(c(1, 4)), array(1, c(2, 2)))



