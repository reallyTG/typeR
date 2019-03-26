library(DepthProc)


### Name: depthMedian
### Title: Depth median
### Aliases: depthMedian depthMedian,matrix-method
###   depthMedian,data.frame-method depthMedian,Depth-method

### ** Examples


# depthMedian for matrix
x <- matrix(rnorm(600), nc = 3)
depthMedian(x)

# depthMedian works with object of class Depth
dp <- depth(x)
depthMedian(dp)




