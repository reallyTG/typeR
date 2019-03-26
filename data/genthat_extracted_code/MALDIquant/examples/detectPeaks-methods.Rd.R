library(MALDIquant)


### Name: detectPeaks-methods
### Title: Detects peaks in a MassSpectrum object.
### Aliases: detectPeaks detectPeaks,MassSpectrum-method
###   detectPeaks,list-method
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

## smoothing spectrum
s <- smoothIntensity(s, method="MovingAverage")

## remove baseline
s <- removeBaseline(s)

## plot spectrum
plot(s)

## call peak detection
p <- detectPeaks(s)

## draw peaks on the plot
points(p)

## label 10 highest peaks
top10 <- intensity(p) %in% sort(intensity(p), decreasing=TRUE)[1:10]
labelPeaks(p, index=top10)



