library(medfate)


### Name: spwbgrid
### Title: Soil-plant water balance and lateral water discharge
### Aliases: spwbgrid plot.spwbgrid

### ** Examples

## Not run: 
##D # Load spatial grid landscape object
##D data("exampleSGL")
##D 
##D #Load meteorological data (the same will be used for all points)
##D data("examplemeteo")
##D 
##D #Load species parameters
##D data("SpParamsMED")
##D 
##D # Deactivate extra console output
##D control = defaultControl()
##D control$verbose = FALSE
##D 
##D # Run water balance simulation over the grid for five days
##D # (you can test longer periods)
##D res <- spwbgrid(exampleSGL, SpParamsMED, examplemeteo[1:5,], 
##D                 control = control, summaryFreq = "months")
## End(Not run)



