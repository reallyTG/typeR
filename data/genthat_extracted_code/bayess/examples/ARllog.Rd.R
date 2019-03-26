library(bayess)


### Name: ARllog
### Title: log-likelihood associated with an AR(p) model defined either
###   through its natural coefficients or through the roots of the
###   associated lag-polynomial
### Aliases: ARllog
### Keywords: time series auto-regressive model

### ** Examples

ARllog(p=3,dat=faithful[,1],pr=3,pc=0,
lr=c(-.1,.5,.2),lc=0,mu=0,sig2=var(faithful[,1]),compsi=FALSE,pepsi=c(1,rep(.1,3)))



