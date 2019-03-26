library(spate)


### Name: innov.spec
### Title: Spectrum of the innovation term epsilon.
### Aliases: innov.spec

### ** Examples

n <- 100
spec <- innov.spec(wave=spate.init(n=n,T=1)$wave,n=n,rho0=0.05,sigma2=0.5,zeta=0.5,
                   rho1=0.05,alpha=pi/4,gamma=2,norm=TRUE)
sim <- real.fft(sqrt(spec)*rnorm(n*n),n=n,inv=FALSE)
image(1:n,1:n,matrix(sim,nrow=n),main="Sample from the integrated
stochastic innovation",xlab="",ylab="",col=cols())



