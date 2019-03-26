library(loa)


### Name: 5.3.plot.addXYFit.functions
### Title: Plot addXYFit... functions
### Aliases: 5.3.plot.addXYFit.functions addXYFit.functions addXYLMFit
###   addXYLOESSFit addXYFit_prep loaXYFit_lm loaXYFit_loess panel.loaXYFit
### Keywords: methods

### ** Examples


# add lm fit a loaPlot
addXYLMFit(loaPlot(cadmium~copper*zinc, data=lat.lon.meuse))

## Not run: 
##D 
##D loaPlot(cadmium~copper*zinc, data=lat.lon.meuse)
##D addXYLOESSFit(col="red")
##D 
##D p <- loaPlot(cadmium~copper*zinc, data=lat.lon.meuse)
##D addXYLMFit(p, se.col="grey", report.position=c(0.95, 0.22))
##D 
## End(Not run)




