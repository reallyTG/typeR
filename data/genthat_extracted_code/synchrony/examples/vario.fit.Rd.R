library(synchrony)


### Name: vario.fit
### Title: vario.fit
### Aliases: vario.fit
### Keywords: variogram

### ** Examples

# Load data
data(pisco.data)
# Environmental variogram
d=subset(pisco.data, subset=year==2000, select=c("latitude", "longitude", "upwelling"))
semiv=vario(data=d)
plot(semiv, xlab="Lag distance (km)")
mod.sph=vario.fit(semiv$vario, semiv$mean.bin.dist)
# Weighted least squares fit based on the number of points
mod.exp=vario.fit(semiv$vario, semiv$mean.bin.dist, 
                  weights=semiv$npoints/sum(semiv$npoints), 
                  type="expo")
mod.gau=vario.fit(semiv$vario, semiv$mean.bin.dist, type="gauss")
mod.lin=vario.fit(semiv$vario, semiv$mean.bin.dist, type="lin")
lines(semiv$mean.bin.dist, mod.sph$fit, col="red")
lines(semiv$mean.bin.dist, mod.exp$fit, col="black")
lines(semiv$mean.bin.dist, mod.gau$fit, col="blue")
lines(semiv$mean.bin.dist, mod.lin$fit, col="green")
legend(x="topleft", legend=paste(c("Spherical AIC:", "Exponential AIC:", 
                                   "Gaussian AIC:", "Linear AIC:"), 
                                   c(format(mod.sph$AIC, dig=2), 
                                   format(mod.exp$AIC, dig=2), 
                                   format(mod.gau$AIC, dig=2), 
       format(mod.lin$AIC, dig=2))), lty=1, col=c("red", "black", "blue", "green"), 
       bty="n")

# Correlogram
cover=subset(pisco.data, subset=year==2000, 
             select=c("latitude", "longitude", "mussel_abund"))
moran=vario(data=cover, type="moran")
mod.hol=vario.fit(moran$vario, moran$mean.bin.dist, 
                  type="hole", start.vals=list(c0=0.6, a=25, c1=0.01))
mod.per=vario.fit(moran$vario, moran$mean.bin.dist, type="period",
                  start.vals=list(a=1, b=3, c=0))
mod.lin=vario.fit(moran$vario, moran$mean.bin.dist, type="linear")
plot(moran, xlab="Lag distance (km)", ylim=c(-0.6, 0.8))
lines(moran$mean.bin.dist, mod.per$fit, col="red")
lines(moran$mean.bin.dist, mod.hol$fit, col="black")
lines(moran$mean.bin.dist, mod.lin$fit, col="blue")
legend(x="topleft", legend=paste(c("Periodic AIC:", "Hole AIC:", 
                                   "Linear AIC:"), 
                                   c(format(mod.per$AIC, dig=2), 
                                   format(mod.hol$AIC, dig=2), 
                                   format(mod.lin$AIC, dig=2))), 
                                   lty=1, col=c("red", "black", "blue"), bty="n")



