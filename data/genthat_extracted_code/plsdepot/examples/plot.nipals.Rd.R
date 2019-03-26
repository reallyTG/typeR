library(plsdepot)


### Name: plot.nipals
### Title: Plot NIPALS basic results
### Aliases: plot.nipals

### ** Examples

## Not run: 
##D  # load data climbing ropes
##D  data(ropes)
##D 
##D  # apply nipals with 3 components
##D  nip1 = nipals(ropes[,-1], comps=3)
##D 
##D  # plot variables (correlations)
##D  plot(nip1)
##D 
##D  # plot observations
##D  plot(nip1, what="obs")
##D 
##D  # plot observations with names
##D  plot(nip1, what="obs", show.names=TRUE)
##D  
## End(Not run)



