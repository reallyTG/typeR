library(sads)


### Name: octav-class
### Title: Class '"octav"' for frequencies in abundance octaves
### Aliases: octav-class lines,octav-method plot,octav,ANY-method
###   plot,octav-method points,octav-method
### Keywords: classes

### ** Examples

## Creates an octav object from an abundance vector
birds.oc <- octav(birds)
moths.oc <- octav(moths)

## default plot
plot(birds.oc)
## Octave values instead of abundances at x-axis
plot(moths.oc, x.oct=TRUE)

## Using line and argument prop to superpose two data sets
## (Fisher's et al moth data and Preston's bird data)
## mid=FALSE plots points at each octave value and not
## in the midclass (default, useful for histograms)
plot(moths.oc, col=NULL, border=NA, prop=TRUE, x.oct=TRUE, xlab="Octave")
lines(moths.oc, prop=TRUE,  mid=FALSE)
lines(birds.oc, prop=TRUE, mid=FALSE, col="red") 




