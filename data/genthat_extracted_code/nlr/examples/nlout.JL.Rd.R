library(nlr)


### Name: nlout.JL
### Title: Nonlinear outlier detection.
### Aliases: nlout.JL
### Keywords: Mahalanobis distance Cook Distance Jacobian Leverage
###   Studentized Residuals

### ** Examples

d<-list(xr=Weights$Date, yr=Weights$Weight)
wmodel <- nlr(nlrobj1[[2]],data=d,control=nlr.control(method = "OLS",trace=TRUE))
a=nlout.JL(wmodel)
plot(a[[2]])



