library(nlsrk)


### Name: nlscontour
### Title: Contour plot for nonlinear least squares
### Aliases: nlscontour
### Keywords: nonlinear

### ** Examples

data(logis)
attach(logis)
m1<-nls(y~k/(1+c*exp(-r*time)),data=logis,start=c(k=100,r=0.1,c=40))
nlscontour(m1)
detach(logis)



