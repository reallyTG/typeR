library(dendrometeR)


### Name: fill_plot
### Title: Plot gap-filled dendrometer series
### Aliases: fill_plot

### ** Examples

## Not run: 
##D 
##D data(dmCD)
##D ## creating some artificial gaps (for demonstration purposes):
##D dmCD[c(873:877,985:990),1] <- NA
##D dm.gpf <- fill_gaps(dmCD, Hz = 0.01)
##D fill_plot(dmCD, dm.gpf, period = c(137,144))
## End(Not run)




