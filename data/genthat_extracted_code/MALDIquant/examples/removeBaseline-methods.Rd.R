library(MALDIquant)


### Name: removeBaseline-methods
### Title: Removes the baseline of a MassSpectrum object.
### Aliases: removeBaseline removeBaseline,MassSpectrum-method
###   removeBaseline,list-method
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## choose only the first mass spectrum
s <- fiedler2009subset[[1]]

## plot spectrum
plot(s)

## subtract baseline
b <- removeBaseline(s, method="SNIP")

## draw modified spectrum on the plot
lines(b, col="blue")



