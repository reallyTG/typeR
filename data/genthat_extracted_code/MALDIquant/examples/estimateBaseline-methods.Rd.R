library(MALDIquant)


### Name: estimateBaseline-methods
### Title: Estimates the baseline of a MassSpectrum object.
### Aliases: estimateBaseline estimateBaseline,MassSpectrum-method
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## choose only the first mass spectrum
s <- fiedler2009subset[[1]]


## SNIP
plot(s)

## estimate baseline
b <- estimateBaseline(s, method="SNIP", iterations=100)

## draw baseline on the plot
lines(b, col="red")


## TopHat
plot(s)

## estimate baseline (try different parameters)
b1 <- estimateBaseline(s, method="TopHat", halfWindowSize=75)
b2 <- estimateBaseline(s, method="TopHat", halfWindowSize=150)

## draw baselines on the plot
lines(b1, col=2)
lines(b2, col=3)

## draw legend
legend(x="topright", lwd=1, legend=paste0("halfWindowSize=", c(75, 150)),
       col=c(2, 3))


## ConvexHull
plot(s)

## estimate baseline
b <- estimateBaseline(s, method="ConvexHull")

## draw baseline on the plot
lines(b, col="red")


## Median
plot(s)

## estimate baseline
b <- estimateBaseline(s, method="median")

## draw baseline on the plot
lines(b, col="red")



