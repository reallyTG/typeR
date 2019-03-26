library(saws)


### Name: saws-package
### Title: Small-Sample Adjustments for Wald tests Using Sandwich
###   Estimators
### Aliases: saws-package
### Keywords: package

### ** Examples

library(gee)
data(warpbreaks)
g<-gee(breaks~tension,id=wool, data=warpbreaks, corstr="exchangeable")
guo<-geeUOmega(g)
saws(guo)



