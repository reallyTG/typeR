library(spate)


### Name: propagate.spectral
### Title: Function that propagates a state (spectral coefficients).
### Aliases: propagate.spectral

### ** Examples

n <- 50
spec <- matern.spec(wave=spate.init(n=n,T=1)$wave,n=n,rho0=0.05,sigma2=1,norm=TRUE)
alphat <- sqrt(spec)*rnorm(n*n)
##Propagate initial state
wave <- wave.numbers(n)
Gvec <- get.propagator.vec(wave=wave$wave,indCos=wave$indCos,zeta=0.1,rho1=0.02,gamma=2,
                  alpha=pi/4,muX=0.2,muY=0.2,dt=1,ns=4)
alphat1 <- propagate.spectral(alphat,n=n,Gvec=Gvec)

par(mfrow=c(1,2))
image(1:n,1:n,matrix(real.fft(alphat,n=n,inv=FALSE),nrow=n),main="Whittle
field",xlab="",ylab="",col=cols())
image(1:n,1:n,matrix(real.fft(alphat1,n=n,inv=FALSE),nrow=n),main="Propagated
field",xlab="",ylab="",col=cols())



