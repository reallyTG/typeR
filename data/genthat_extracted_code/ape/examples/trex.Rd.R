library(ape)


### Name: trex
### Title: Tree Explorer With Multiple Devices
### Aliases: trex
### Keywords: hplot

### ** Examples

## Not run: 
##D tr <- rcoal(1000)
##D plot(tr, show.tip.label = FALSE)
##D trex(tr) # left-click as many times as you want, then right-click
##D tr <- makeNodeLabel(tr)
##D trex(tr, subbg = "lightgreen") # id.
##D 
##D ## generate a random colour with control on the darkness:
##D rRGB <- function(a, b)
##D     rgb(runif(1, a, b), runif(1, a, b), runif(1, a, b))
##D 
##D ### with a random pale background:
##D trex(tr, subbg = rRGB(0.8, 1))
##D ## the above can be called many times...
##D graphics.off() # close all graphical devices
## End(Not run)


