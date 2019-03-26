library(simest)


### Name: fastmerge
### Title: Pre-binning of Data Points.
### Aliases: fastmerge
### Keywords: Pre-binning

### ** Examples

args(fastmerge)
x <- runif(100,-1,1)
y <- runif(100,-1,1)
DataMat <- cbind(x, y)
tmp <- fastmerge(DataMat)



