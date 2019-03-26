library(Funclustering)


### Name: mfpcaPlot
### Title: Plot multivariate functional pca
### Aliases: mfpcaPlot

### ** Examples

# Multivariate
# ---------  CanadianWeather (data from the package fda) --------
CWtime<- 1:365
CWrange<-c(1,365)
CWbasis <- create.fourier.basis(CWrange, nbasis=65)
harmaccelLfd <- vec2Lfd(c(0,(2*pi/365)^2,0), rangeval=CWrange)

# -- Build the curves ---
temp=CanadianWeather$dailyAv[,,"Temperature.C"]
CWfd1 <- smooth.basisPar(
CWtime, CanadianWeather$dailyAv[,,"Temperature.C"],CWbasis,
Lfdobj=harmaccelLfd, lambda=1e-2)$fd
precip=CanadianWeather$dailyAv[,,"Precipitation.mm"]
CWfd2 <- smooth.basisPar(
CWtime, CanadianWeather$dailyAv[,,"Precipitation.mm"],CWbasis,
Lfdobj=harmaccelLfd, lambda=1e-2)$fd

CWfd=list(CWfd1,CWfd2)

pca=mfpca(CWfd,nharm=4)
mfpcaPlot(pca,grid=c(2,2))



