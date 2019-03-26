library(spate)


### Name: spate.sim
### Title: Simulate from the SPDE.
### Aliases: spate.sim

### ** Examples

StartVal <- rep(0,100^2)
StartVal[75*100+75] <- 1000
par <- c(rho0=0.05,sigma2=0.7^2,zeta=-log(0.99),rho1=0.06,
         gamma=3,alpha=pi/4,muX=-0.1,muY=-0.1,tau2=0.00001)
spateSim <- spate.sim(par=par,n=100,T=6,StartVal=StartVal,seed=1)
plot(spateSim,mfrow=c(2,3),mar=c(2,2,2,2),indScale=TRUE,
     cex.axis=1.5,cex.main=2)



