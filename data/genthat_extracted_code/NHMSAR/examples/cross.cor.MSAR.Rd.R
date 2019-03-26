library(NHMSAR)


### Name: cross.cor.MSAR
### Title: empirical cross-correlation for multivariate MSAR time series
### Aliases: cross.cor.MSAR
### Keywords: Cross-correlation function Validation

### ** Examples

data(Wind)
T = dim(U)[1]
c = cross.cor.MSAR(U,nc1=1,nc2=18,names=1:18)
## Not run
#Y = U[,,c(1,18)]
#theta.init=init.theta.MSAR(Y,M=2,order=2,label="HH")
#res.hh = fit.MSAR(Y,theta.init,verbose=TRUE,MaxIter=200)
#Bsim = 20
#N.samples = dim(U)[2]
#Ksim = Bsim*N.samples
#Y0 = Y0
#Y.sim = simule.nh.MSAR(res.hh$theta,Y0 = Y0,T,N.samples = Ksim) 
#c.sim = cross.cor.MSAR(Y.sim$Y,nc1=1,nc2=2,names=c(1,18),
#   CI=TRUE,Bsim=Bsim,N.samples=N.samples,add=TRUE,col="red")



