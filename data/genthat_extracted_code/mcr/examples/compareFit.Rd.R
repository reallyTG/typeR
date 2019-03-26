library(mcr)


### Name: compareFit
### Title: Graphical Comparison of Regression Parameters and Associated
###   Confidence Intervals
### Aliases: compareFit

### ** Examples

library("mcr")
     data("creatinine", package="mcr")
     fit.lr <- mcreg(as.matrix(creatinine), method.reg="LinReg", na.rm=TRUE)
     fit.wlr <- mcreg(as.matrix(creatinine), method.reg="WLinReg", na.rm=TRUE)
     compareFit( fit.lr, fit.wlr )



