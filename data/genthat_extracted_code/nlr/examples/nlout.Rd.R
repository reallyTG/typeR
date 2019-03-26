library(nlr)


### Name: nlout
### Title: Nonlinear outlier detection.
### Aliases: nlout
### Keywords: Mahalanobis distance Cook Distance Studentized Residuals

### ** Examples

 d<-list(xr=Weights$Date, yr=Weights$Weight)
 wmodel <- nlr(nlrobj1[[2]],data=d,control=nlr.control(method = "OLS",trace=TRUE))
 a=nlout(wmodel)
 plot(a[[3]]) # is in fact wrong inference due to hetroscedasticity



