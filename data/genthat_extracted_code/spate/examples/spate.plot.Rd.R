library(spate)


### Name: spate.plot
### Title: Plot a spatio-temporal field.
### Aliases: spate.plot

### ** Examples

spateSim <- spate.sim(par=c(rho0=0.1,sigma2=0.2,zeta=0.5,rho1=0.1,gamma=2,
                      alpha=pi/4,muX=0.2,muY=-0.2,tau2=0.01),n=50,T=9)
spate.plot(spateSim$xi)



