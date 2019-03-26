library(ocedata)


### Name: RRprofile
### Title: Seawater profile used by Reiniger and Ross (1968)
### Aliases: RRprofile
### Keywords: datasets

### ** Examples

## Not run: 
##D library(oce)
##D data(RRprofile, package="ocedata")
##D par(mgp=getOption('oceMgp'))
##D par(mar=c(3,3,1,1))
##D ctd <- as.ctd(RRprofile$salinity, RRprofile$temperature, RRprofile$depth)
##D plot(ctd)
##D zz <- seq(0,2000,5)
##D plot(RRprofile$temperature, RRprofile$depth, ylim=c(500,0), xlim=c(2,11),
##D      xlab="Temperature", ylab="Depth [m]")
##D TT <- oceApprox(RRprofile$depth, RRprofile$temperature, zz)
##D lines(TT, zz)
##D a <- approx(RRprofile$depth, RRprofile$temperature, zz)
##D lines(a$y, zz, col='red')
##D s <- smooth.spline(RRprofile$depth, RRprofile$temperature)
##D lines(predict(s, zz)$y, zz, col='blue')
##D legend("topright", lwd=1, col=c("black", "red", "blue"),
##D       legend=c("oceApprox", "approx", "smooth.spline"), cex=2/3)
## End(Not run)



