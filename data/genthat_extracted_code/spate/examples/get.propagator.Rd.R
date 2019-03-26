library(spate)


### Name: get.propagator
### Title: Propagator matrix G.
### Aliases: get.propagator

### ** Examples

##For illustration, four grid points on each axis
n <- 4
wave <- wave.numbers(n)
G <- get.propagator(wave=wave$wave,indCos=wave$indCos,zeta=0.5, rho1=0.1, gamma=2,
           alpha=pi/4, muX=0.2, muY=-0.15,dt=1,ns=4)
round(G,digits=2)
## View(round(G,digits=2))

##An example
n <- 50
spec <- matern.spec(wave=spate.init(n=n,T=1)$wave,n=n,rho0=0.05,sigma2=1,norm=TRUE)
alphat <- sqrt(spec)*rnorm(n*n)
##Propagate initial state
wave <- wave.numbers(n)
G <- get.propagator(wave=wave$wave,indCos=wave$indCos,zeta=0.5, rho1=0.02, gamma=2,
            alpha=pi/4, muX=0.2, muY=0.2,dt=1,ns=4)
alphat1 <- G%*%alphat

par(mfrow=c(1,2))
image(1:n,1:n,matrix(real.fft(alphat,n=n,inv=FALSE),nrow=n),main="Whittle
field",xlab="",ylab="",col=cols())
image(1:n,1:n,matrix(real.fft(alphat1,n=n,inv=FALSE),nrow=n),main="Propagated
field",xlab="",ylab="",col=cols())



