library(UncerIn2)


### Name: TUTORIAL
### Title: Package UncerIn2 TUTORIAL
### Aliases: TUTORIAL

### ** Examples

## package UncerIn2 TUTORIAL

## Example data import and definition
# dataset meuse import
data(meuse)
# S4 class object Points input data definition
points = Points(x = meuse$x, y = meuse$y, z = meuse$elev)

## Uncertainty creation
# building uncertainty model (based on uncertaintyError function)
uncertaintyModel = uncertaintyError(points)

## Grid creation
# generate grid for interpolation
gridDef = Grid.def(points) # data.frame
gridDef.spat = Grid.def(points, TRUE) # SpatialPixels
# OR (bounded by box)
# gridBox = Grid.box(points) # data.frame
# gridBox.spat = Grid.box(points, TRUE) # SpatialPixels

## Iinterpolation
IDW = idwUncertain(uncertaintyModel, gridDef.spat)
# spline = splineUncertain(uncertaintyModel, gridDef)
# kriging = krigingUncertain(uncertaintyModel, gridDef.spat)

## variogram estimation
# var = variogram(uncertaintyModel)
# show(var)

# visualization of results
Plot(IDW)



