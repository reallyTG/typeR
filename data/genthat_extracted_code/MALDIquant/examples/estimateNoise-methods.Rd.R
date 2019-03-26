library(MALDIquant)


### Name: estimateNoise-methods
### Title: Estimates the noise of a MassSpectrum object.
### Aliases: estimateNoise estimateNoise,MassSpectrum-method
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## choose only the first mass spectrum
s <- fiedler2009subset[[1]]

## transform intensities
s <- transformIntensity(s, method="sqrt")

## remove baseline
s <- removeBaseline(s)

## plot spectrum
plot(s)

## estimate noise
nm <- estimateNoise(s, method="MAD")
nss <- estimateNoise(s, method="SuperSmoother")

## draw noise on the plot
lines(nm, col=2)
lines(nss, col=4)

## draw legend
legend(x="topright", lwd=1, legend=c("MAD", "SuperSmoother"),
       col=c(2, 4))



