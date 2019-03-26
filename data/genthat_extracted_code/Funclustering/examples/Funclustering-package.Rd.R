library(Funclustering)


### Name: Funclustering-package
### Title: A package for functional data clustering.
### Aliases: Funclustering-package Funclustering

### ** Examples

 # Multivariate
# ---------  CanadianWeather (data from the fda package) --------
 CWtime<- 1:365
 CWrange<-c(1,365)
 CWbasis <- create.fourier.basis(CWrange, nbasis=65)
 harmaccelLfd <- vec2Lfd(c(0,(2*pi/365)^2,0), rangeval=CWrange)
 
 # -- Build the curves --
 temperature=CanadianWeather$dailyAv[,,"Temperature.C"]
 CWfd1 <- smooth.basisPar(
 CWtime, CanadianWeather$dailyAv[,,"Temperature.C"],CWbasis,
 Lfdobj=harmaccelLfd, lambda=1e-2)$fd
 precipitation=CanadianWeather$dailyAv[,,"Precipitation.mm"]
 CWfd2 <- smooth.basisPar(
 CWtime, CanadianWeather$dailyAv[,,"Precipitation.mm"],CWbasis,
 Lfdobj=harmaccelLfd, lambda=1e-2)$fd
 
 # -- the multivariate functional data object --  
 CWfd=list(CWfd1,CWfd2) 
 
 # -- clustering in two class -- 
 res=funclust(CWfd,K=2)
 summary(res)




