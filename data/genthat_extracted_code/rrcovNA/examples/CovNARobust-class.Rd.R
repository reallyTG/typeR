library(rrcovNA)


### Name: CovNARobust-class
### Title: Class "CovNARobust" - virtual base class for robust estimates of
###   multivariate location and scatter for incomplete data
### Aliases: CovNARobust-class summary,CovNARobust-method
###   plot,CovNARobust,missing-method
### Keywords: classes robust multivariate

### ** Examples

     data(hbk)
     hbk.x <- data.matrix(hbk[, 1:3])
     cv <- CovMest(hbk.x)               # it is not possible to create an object of
                                        # class CovRobust, since it is a VIRTUAL class
     cv
     summary(cv)                        # summary method for class CovRobust
     plot(cv)                           # plot method for class CovRobust



