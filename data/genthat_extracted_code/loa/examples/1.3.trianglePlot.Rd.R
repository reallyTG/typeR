library(loa)


### Name: 1.3.trianglePlot
### Title: Triangle plots
### Aliases: 1.3.triangle.plots trianglePlot panel.trianglePlot
###   panel.triangleByGroupPolygon panel.triangleKernelDensity
###   panel.triangleSurfaceSmooth panel.trianglePlotFrame
###   panel.trianglePlotAxes panel.trianglePlotGrid triLimsReset triABC2XY
###   triXY2ABC triABCSquareGrid
### Keywords: methods

### ** Examples


## Example 1
## Basic triangle plot usage

trianglePlot(cadmium~copper+lead+zinc|lime, 
             data=lat.lon.meuse)

# Notes:
# Formula structure z ~ a0 + b0 + c0 |cond, where a0, b0 and 
# c0 are the three axes of the triangle plot 
# Data (and groups) assignment like in standard lattice plots.
# By default z is linked to col and cex. 
# Unless overridden by user inputs or group or zcase setting. 
# Plot handling is similar to loaPlot 
# (So, see ?loaPlot and ?panelPal for further details.)

# Formula variations:
# basic triangle plot without z values assignment
# trianglePlot(~a0+b0+c0, ...) 
# ... with z values set
# trianglePlot(z~a0+b0+c0, ...)
# ... with grouping 
# trianglePlot(z~a0+b0+c0, groups=grps, ...)


## Example 2 
## Basic frame (axes, grid, tick, annotation) management 

  trianglePlot(~1+1+1, type="n", 
               grid.alpha = 0.2, 
               ticks.alpha = 0.2)         ## grid and tick alpha reset

# notes:
# Here, grid and ticks arguments are used to remove or modify these 
# elements of the plot frame individually.  
# Setting can be management in list form like in normal lattice or 
# in a loa shorthand where e.g. the argument grid.a0.lty = 1 is equivalent 
# to grid = list(a0 = list(lty = 1))
# (So, quicker if you are only changing a small number of elements.)
 



