library(ocedata)


### Name: papa
### Title: OWS Papa hydrographic record during 2010
### Aliases: papa
### Keywords: datasets

### ** Examples

## Not run: 
##D library(oce)
##D data(papa, package="ocedata")
##D 
##D par(mfrow=c(3,1))
##D ## Page 1: images
##D imagep(papa$t, papa$z, papa$temperature, col=oceColorsJet, filledContour=TRUE)
##D imagep(papa$t, papa$z, papa$salinity, col=oceColorsJet, filledContour=TRUE)
##D imagep(papa$t, papa$z, papa$sigmaTheta, col=oceColorsJet, filledContour=TRUE)
##D ## Page 2: lineplots
##D xlim <- c(min(papa$t)-3*28*86400, max(papa$t)) # extra for legend
##D plot(papa$t, papa$temperature[,1], type='l', xlim=xlim,
##D      xlab="", ylab="Temperature", ylim=range(papa$temperature))
##D for (i in 2:dim(papa$temperature)[2])
##D     lines(papa$t, papa$temperature[,i], col=i, lwd=2)
##D legend("topleft", title="z [m]", lwd=2, legend=papa$z, col=1:length(papa$z), bg="white")
##D plot(papa$t, papa$salinity[,1], type='l', xlim=xlim,
##D      xlab="", ylab="Salinity", ylim=range(papa$salinity), lwd=2)
##D for (i in 2:dim(papa$salinity)[2])
##D     lines(papa$t, papa$salinity[,i], col=i, lwd=2)
##D legend("topleft", title="z [m]", lwd=2, legend=papa$z, col=1:length(papa$z), bg="white")
##D plot(papa$t, papa$sigmaTheta[,1], type='l', xlim=xlim,
##D      xlab="", ylab=expression(sigma[theta]), ylim=range(papa$sigmaTheta), lwd=2)
##D for (i in 2:dim(papa$sigmaTheta)[2])
##D     lines(papa$t, papa$sigmaTheta[,i], col=i, lwd=2)
##D legend("topleft", title="z [m]", lwd=2, legend=papa$z, col=1:length(papa$z), bg="white")
## End(Not run)



