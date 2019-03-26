library(plsdepot)


### Name: plot.simpls
### Title: Plot simpls basic results
### Aliases: plot.simpls

### ** Examples

## Not run: 
##D  # load dataset linnerud
##D  data(linnerud)
##D 
##D  # apply simpls
##D  sim = simpls(linnerud[,1:3], linnerud[,4:6])
##D 
##D  # plot variables (circle of correlations)
##D  plot(sim, what="variables")
##D 
##D  # plot observations (as points)
##D  plot(sim, what="observations")
##D 
##D  # plot observations with names
##D  plot(sim, what="observations", show.names=TRUE)
##D  
## End(Not run)



