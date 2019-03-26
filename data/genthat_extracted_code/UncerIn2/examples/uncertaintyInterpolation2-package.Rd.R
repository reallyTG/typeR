library(UncerIn2)


### Name: uncertaintyInterpolation2-information
### Title: Implements models of uncertainty into the interpolation
###   functions
### Aliases: 'Uncertainty Interpolation 2-package'
### Keywords: package

### ** Examples

# dataset meuse import
data(meuse)

# S4 class object Points input data definition
points = Points(x = meuse$x, y = meuse$y, z = meuse$elev)

# building uncertainty model (based on uncertaintyError function)
uncertaintyModel = uncertaintyError(points)

# generate grid for IDW interpolation
gridDef.spat = Grid.def(points, TRUE) # SpatialPixels

# IDW interpolation process
IDW = idwUncertain(uncertaintyModel, gridDef.spat)

# visualization of results
Plot(IDW)



