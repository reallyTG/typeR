library(spate)


### Name: get.propagator.vec
### Title: Propagator matrix G in vector form.
### Aliases: get.propagator.vec

### ** Examples

##For illustration, four grid points on each axis
n <- 4
wave <- wave.numbers(n)
G <- get.propagator(wave=wave$wave,indCos=wave$indCos,zeta=0.5, rho1=0.1,
           gamma=2,alpha=pi/4, muX=0.2, muY=-0.15,dt=1,ns=4)
diag(G)[1:4]
diag(G[wave$indCos,wave$indCos])
diag(G[wave$indCos,wave$indCos+1])
get.propagator.vec(wave=wave$wave,indCos=wave$indCos,zeta=0.5, rho1=0.1,
gamma=2,alpha=pi/4, muX=0.2, muY=-0.15,dt=1,ns=4)



