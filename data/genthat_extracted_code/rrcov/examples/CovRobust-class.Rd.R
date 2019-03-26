library(rrcov)


### Name: CovRobust-class
### Title: Class "CovRobust" - virtual base class for robust estimates of
###   multivariate location and scatter
### Aliases: CovRobust-class isClassic,CovRobust-method
###   getMeth,CovRobust-method show,CovRobust-method
###   summary,CovRobust-method getRaw,CovRobust-method
### Keywords: classes robust multivariate

### ** Examples

     data(hbk)
     hbk.x <- data.matrix(hbk[, 1:3])
     cv <- CovMest(hbk.x)               # it is not possible to create an object of
                                        # class CovRobust, since it is a VIRTUAL class
     cv
     summary(cv)                        # summary method for class CovRobust
     plot(cv)                           # plot method for class CovRobust



