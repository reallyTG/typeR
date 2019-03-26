library(mapi)


### Name: MAPI_Plot
### Title: Function MAPI_Plot
### Aliases: MAPI_Plot

### ** Examples

## Not run: 
##D data("metric")
##D data("samples")
##D resu <- MAPI_RunAuto(samples, metric, crs=3857, nbPermuts = 1000)
##D tails <- MAPI_Tails(resu)
##D pl <- MAPI_Plot(resu, tails=tails, samples=samples)
##D # Open png driver
##D png("mapiPlotOutput.png", width=1000, type="cairo-png")
##D print(pl) # Do plot in file
##D dev.off() # Close driver
## End(Not run)



