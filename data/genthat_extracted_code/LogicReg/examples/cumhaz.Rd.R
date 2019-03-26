library(LogicReg)


### Name: cumhaz
### Title: Cumulative hazard transformation
### Aliases: cumhaz
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.testdat)
#
# this is not survival data, but it shows the functionality
yy <- cumhaz(exp(logreg.testdat[,1]), logreg.testdat[, 2])
# then we would use
# logreg(resp=yy, cens=logreg.testdat[,2], type=5, ...
# insted of
# logreg(resp=logreg.testdat[,1], cens=logreg.testdat[,2], type=4, ...



