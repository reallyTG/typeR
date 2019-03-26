library(RSAGA)


### Name: rsaga.parallel.processing
### Title: Parallel Processing
### Aliases: rsaga.parallel.processing
### Keywords: interface spatial

### ** Examples

## Not run: 
##D # SAGA GIS 2.0.6+:
##D rsaga.get.usage("ta_hydrology","Catchment Area (Parallel)")
##D # earlier versions of SAGA GIS:
##D #rsaga.get.usage("ta_hydrology","Parallel Processing")
##D # execute model with typical settings:
##D rsaga.parallel.processing(in.dem = "dem", out.carea = "carea", out.cslope = "cslope")
##D # cslope is in radians - convert to degree:
##D fac = round(180/pi, 4)
##D formula = paste(fac, "*a", sep = "")
##D rsaga.grid.calculus("cslope", "cslopedeg", formula)
## End(Not run)



