library(medfate)


### Name: spwbpoints
### Title: Model simulations for spatially-distributed forest stands
### Aliases: spwbpoints growthpoints

### ** Examples

## Not run: 
##D # Load spatial points forest object
##D data("exampleSPL")
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
##D # Run simulation for the first two forest plots
##D # (you can run the code without subsetting 'exampleSPL')
##D res <- spwbpoints(exampleSPL, SpParamsMED, examplemeteo, control = control)
##D 
##D #Extract summaries for a given forest plot
##D summary(res$result$`80001`, freq="months",FUN=sum, 
##D         output="PlantStress", bySpecies = TRUE)
## End(Not run)



