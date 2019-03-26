library(fpc)


### Name: mergenormals
### Title: Clustering by merging Gaussian mixture components
### Aliases: mergenormals summary.mergenorm print.summary.mergenorm
### Keywords: multivariate cluster

### ** Examples

  require(mclust)
  require(MASS)
  options(digits=3)
  data(crabs)
  dc <- crabs[,4:8]
  cm <- mclustBIC(crabs[,4:8],G=9,modelNames="EEE")
  scm <- summary(cm,crabs[,4:8])
  cmnbhat <- mergenormals(crabs[,4:8],scm,method="bhat")
  summary(cmnbhat)
  cmndemp <- mergenormals(crabs[,4:8],scm,method="demp")
  summary(cmndemp)
# Other methods take a bit longer, but try them!
# The values of by and M below are still chosen for reasonably fast execution.
# cmnrr <- mergenormals(crabs[,4:8],scm,method="ridge.ratio",by=0.05)
# cmd <- mergenormals(crabs[,4:8],scm,method="dip.tantrum",by=0.05)
# cmp <- mergenormals(crabs[,4:8],scm,method="predictive",M=3)



