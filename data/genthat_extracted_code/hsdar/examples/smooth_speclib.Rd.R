library(hsdar)


### Name: noiseFiltering
### Title: Smooth spectra
### Aliases: noiseFiltering smoothSpeclib
### Keywords: smooth

### ** Examples

data(spectral_data)

## Example of predefined filter functions
## Savitzky-Golay
sgolay <- noiseFiltering(spectral_data, method="sgolay", n=25)

## Spline
spline <- noiseFiltering(spectral_data, method="spline", 
                         n=round(nbands(spectral_data)/10,0))

## Lowess
lowess <- noiseFiltering(spectral_data, method="lowess", f=.01)

## Mean
meanflt <- noiseFiltering(spectral_data, method="mean", p=5)

par(mfrow=c(2,2))
plot(spectral_data, FUN=1, main="Savitzky-Golay")
plot(sgolay, FUN=1, new=FALSE, col="red", lty="dotted")
plot(spectral_data, FUN=1, main="Spline")
plot(spline, FUN=1, new=FALSE, col="red", lty="dotted")
plot(spectral_data, FUN=1, main="Lowess")
plot(lowess, FUN=1, new=FALSE, col="red", lty="dotted")
plot(spectral_data, FUN=1, main="Mean")
plot(meanflt, FUN=1, new=FALSE, col="red", lty="dotted")

## Example of a not predefined filter function (Butterworth filter)
bf <- butter(3, 0.1)
bf_spec <- noiseFiltering(spectral_data, method="filter", filt=bf)
plot(spectral_data, FUN=1, main="Butterworth filter")
plot(bf_spec, FUN=1, new=FALSE, col="red", lty="dotted")




