library(riskRegression)


### Name: sliceMultiply_cpp
### Title: Apply * by slice
### Aliases: sliceMultiply_cpp sliceMultiplyPointer_cpp

### ** Examples

x <- array(1, dim = c(2,6,5))
M <- matrix(1:12,2,6)
sweep(x, MARGIN = 1:2, FUN = "*", STATS = M)
sliceMultiply_cpp(x, M) 




