library(ProDenICA)


### Name: GPois
### Title: Fit a tilted Gaussian density via a Poisson GAM
### Aliases: GPois
### Keywords: smooth distribution

### ** Examples

p=2
### Can use letters a-r below for dist
dist="n" 
N=1024
A0<-mixmat(p)
s<-scale(cbind(rjordan(dist,N),rjordan(dist,N)))
x <- s %*% A0
fit=ProDenICA(x,Gfunc=GPois, whiten=TRUE, density=TRUE)
par(mfrow=c(2,1))
plot(fit)



