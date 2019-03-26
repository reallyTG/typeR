library(enveomics.R)


### Name: enve.growthcurve
### Title: enve growthcurve
### Aliases: enve.growthcurve

### ** Examples

# Load data
data("growth.curves", package="enveomics.R", envir=environment())
# Generate growth curves with different colors
g <- enve.growthcurve(growth.curves[,-1], growth.curves[,1], triplicates=TRUE)
# Generate black-and-white growth curves with different symbols
plot(g, pch=15:17, col="black", band.density=45, band.angle=c(-45,45,0))



