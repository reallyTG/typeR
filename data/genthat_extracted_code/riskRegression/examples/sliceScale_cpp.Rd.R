library(riskRegression)


### Name: sliceScale_cpp
### Title: Apply / by slice
### Aliases: sliceScale_cpp sliceScalePointer_cpp

### ** Examples

x <- array(1, dim = c(2,6,5))
M <- matrix(1:12,2,6)
sweep(x, MARGIN = 1:2, FUN = "/", STATS = M)
sliceScale_cpp(x, M) 




