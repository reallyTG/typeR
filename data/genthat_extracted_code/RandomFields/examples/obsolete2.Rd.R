library(RandomFields)


### Name: Obsolete Functions Version 2
### Title: Obsolete functions Version 2
### Aliases: CondSimu Covariance CovarianceFct CovMatrix DeleteRegister
###   DeleteAllRegisters DoSimulateRF EmpiricalVariogram fitvario
###   fractal.dim GaussRF hurst InitSimulateRF InitGaussRF InitMaxStableRF
###   Kriging MaxStableRF RFparameters Variogram
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again




## no examples given, as command is obsolete
## Don't show: 
## Not run: 
##D  # ok
##D x <- seq(0, 5, 0.05) 
##D model <- "exp"
##D param <- c(0, 1, 0, 1)
##D 
##D plot(x, Covariance(x, model=model, param=param))
##D plot(x, Variogram(x, model=model, param=param))
##D 
##D z <- GaussRF(x, model=model, param=param)
##D plot(x, z, type="l")
##D 
##D z <- GaussRF(x=x, y=x, model=model, param=param, grid=TRUE)
##D image(x, x, z)
##D EmpiricalVariogram(x, x, data=z)
##D 
##D g1 <- runif(5) * 2
##D g2 <- runif(5) * 2
##D z <- GaussRF(g1, g2, grid=FALSE, model=model, param=param)
##D k <- Kriging("S", x, x, given=cbind(g1, g2),
##D         data=z, model=model, param=param)
##D Print(range(z), range(k))
##D col <- rainbow(20)
##D zlim <- range(z, k)
##D image(x, x, k, col=col, zlim=zlim)
##D points(g1, g2, pch=20,cex=2)
##D points(g1, g2, pch=16, col=col[pmax(1, (z-zlim[1]) / diff(zlim) * 20 )])
##D ###D 
##D 
##D estparam <- rep(NA, 4)
##D v <- fitvario(x=g1, y=g2, grid=FALSE, model=model, param=estparam, data=z)
##D Print(v$ml, v$ml$ml.value)
## End(Not run)## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


