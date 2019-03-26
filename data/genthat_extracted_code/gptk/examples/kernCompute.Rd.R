library(gptk)


### Name: kernCompute
### Title: Compute the kernel given the parameters and X.
### Aliases: kernCompute kernDiagCompute cmpndKernCompute
###   cmpndKernDiagCompute disimKernCompute disimKernDiagCompute
###   mlpKernCompute multiKernCompute multiKernDiagCompute rbfKernCompute
###   rbfKernDiagCompute simKernCompute simKernDiagCompute
###   translateKernCompute translateKernDiagCompute whiteKernCompute
###   whiteKernDiagCompute disimXdisimKernCompute disimXrbfKernCompute
###   disimXsimKernCompute simXrbfKernCompute simXsimKernCompute
###   whiteXwhiteKernCompute
### Keywords: model

### ** Examples

kern <- kernCreate(1, 'rbf')
K <- kernCompute(kern, as.matrix(3:8))



