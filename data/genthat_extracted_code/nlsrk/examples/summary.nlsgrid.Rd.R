library(nlsrk)


### Name: summary.nlsgrid
### Title: Summary method for objects of class nlsgrid(nlsrk)
### Aliases: summary.nlsgrid
### Keywords: nonlinear

### ** Examples

data(logis)
m1<-nls(y~k/(1+c*exp(-r*time)),data=logis,start=list(k=100,r=0.1,c=45))
gr12<-nlscontour(m1)
summary(gr12)



