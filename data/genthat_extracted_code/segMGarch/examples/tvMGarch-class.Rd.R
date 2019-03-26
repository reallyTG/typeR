library(segMGarch)


### Name: tvMGarch-class
### Title: An S4 class for a nonstationary multivariate class model.
### Aliases: tvMGarch-class

### ** Examples

simObj <- new("simMGarch")
simObj@d <- 10
simObj@n <- 1000
simObj@changepoints <- c(250,750)
simObj <- pc_cccsim(simObj)
empirObj <- new("tvMGarch") #simulated, but treated as a real dataset for illustration
empirObj@y <- simObj@y
empirObj@out_of_sample_prop <- 0.1
#empirObj=garch.seg(object=empirObj,do.parallel = 4)##Not run



