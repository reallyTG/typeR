library(funFEM)


### Name: funFEM-package
### Title: Model-based clustering in the discriminative functional
###   subspaces with the funFEM algorithm
### Aliases: funFEM-package
### Keywords: package

### ** Examples

# Clustering the well-known "Canadian temperature" data (Ramsay & Silverman)
basis <- create.bspline.basis(c(0, 365), nbasis=21, norder=4)
fdobj <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"],basis,
        fdnames=list("Day", "Station", "Deg C"))$fd
res = funFEM(fdobj,K=4)

# Visualization of the partition and the group means
par(mfrow=c(1,2))
plot(fdobj,col=res$cls,lwd=2,lty=1)
fdmeans = fdobj; fdmeans$coefs = t(res$prms$my)
plot(fdmeans,col=1:max(res$cls),lwd=2)



