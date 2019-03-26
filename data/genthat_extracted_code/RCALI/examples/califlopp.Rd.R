library(RCALI)


### Name: califlopp
### Title: Calculation of the Integrated Flow of Particles between Polygons
### Aliases: califlopp
### Keywords: optimize

### ** Examples

# Grid method with compiled constant and seed dispersion functions:
param <- list(method="grid",  grid=list(step=c(50,50)))
## Not run: califlopp("MyPolygonsFile",dispf=c(3,1), param=param)

# Cubature method with a R dispersion function:
param <- list( output=1, input=2, dz=0, dp=100, tz=0)
## Not run: califlopp("MyPolygonsFile", dispf=fpollen, param=param)



