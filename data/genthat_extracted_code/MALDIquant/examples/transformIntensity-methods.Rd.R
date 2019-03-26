library(MALDIquant)


### Name: transformIntensity-methods
### Title: Transforms intensities of an AbstractMassObject object.
### Aliases: transformIntensity
###   transformIntensity,AbstractMassObject-method
###   transformIntensity,list-method
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## choose only the first mass spectrum
s <- fiedler2009subset[[1]]

## transform spectrum
t <- transformIntensity(s, method="sqrt")

## plot spectrum
par(mfrow=c(2, 1))
plot(s, main="raw spectrum")
plot(t, main="transformed spectrum")
par(mfrow=c(1, 1))



