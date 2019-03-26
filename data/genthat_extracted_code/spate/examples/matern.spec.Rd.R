library(spate)


### Name: matern.spec
### Title: Spectrum of the Matern covariance function.
### Aliases: matern.spec

### ** Examples

n <- 100
spec <- matern.spec(wave=spate.init(n=n,T=1)$wave,n=n,rho0=0.05,sigma2=1,norm=TRUE)
sim <- real.fft(sqrt(spec)*rnorm(n*n),n=n,inv=FALSE)
image(1:n,1:n,matrix(sim,nrow=n),main="Sample from a Gaussian process
with Matern covariance function",xlab="",ylab="",col=cols())



