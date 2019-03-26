library(Funclustering)


### Name: funclust
### Title: funclust, clustering multivariate functional data
### Aliases: funclust

### ** Examples

data(growth)
data=cbind(matrix(growth$hgtm,31,39),matrix(growth$hgtf,31,54));
t=growth$age;
splines <- create.bspline.basis(rangeval=c(1, max(t)), nbasis = 20,norder=4);
fd <- Data2fd(data, argvals=t, basisobj=splines);
# with varying dimensions (according to the results of the scree test)
res=funclust(fd,K=2)
summary(res)

# with fixed dimensions
res=funclust(fd,K=2,fixedDimension=c(2,2))


# Multivariate (deactivated by default to comply with CRAN policies)
# ---------  CanadianWeather (data from the package fda) --------
# CWtime<- 1:365
# CWrange<-c(1,365)
# CWbasis <- create.fourier.basis(CWrange, nbasis=65)
# harmaccelLfd <- vec2Lfd(c(0,(2*pi/365)^2,0), rangeval=CWrange)

# -- Build the curves ---
# temp=CanadianWeather$dailyAv[,,"Temperature.C"]
# CWfd1 <- smooth.basisPar(
# CWtime, CanadianWeather$dailyAv[,,"Temperature.C"],CWbasis,
# Lfdobj=harmaccelLfd, lambda=1e-2)$fd
# precip=CanadianWeather$dailyAv[,,"Precipitation.mm"]
# CWfd2 <- smooth.basisPar(
# CWtime, CanadianWeather$dailyAv[,,"Precipitation.mm"],CWbasis,
# Lfdobj=harmaccelLfd, lambda=1e-2)$fd

# CWfd=list(CWfd1,CWfd2)

# res=funclust(CWfd,K=2)



