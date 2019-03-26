library(loa)


### Name: 1.4.stackPlot
### Title: Stack plots
### Aliases: 1.4.stack.plots stackPlot panel.stackPlot
### Keywords: methods

### ** Examples


## Example 1
## Basic stack plot usage

## Not run: 
##D   stackPlot(lead~dist.m, data=lat.lon.meuse)
##D   stackPlot(cadmium+copper+lead+zinc~dist.m, data=lat.lon.meuse)
## End(Not run)

  stackPlot(cadmium*40+copper*5+lead+zinc~dist.m, data=lat.lon.meuse)
 



