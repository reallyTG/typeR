library(tsna)


### Name: formation_and_dissolution
### Title: Counts or fractions of edge transitions in a networkDynamic
###   object
### Aliases: tEdgeFormation tEdgeDissolution

### ** Examples

  library(networkDynamicData)
  data(concurrencyComparisonNets)
  # plot formation and dissolution counts time-series
  plot(tEdgeFormation(base),col='green', 
    main='edge formation and dissolution rates per timestep of base')
  points(tEdgeDissolution(base),col='red',type='l')
  ## Not run: 
##D   # compute fraction of ties dissolving every 10 steps
##D   tEdgeDissolution(base,time.interval = 10,result.type = 'fraction')
##D   # compute fraction of empty dyads forming ties every 10 steps
##D   tEdgeFormation(base,time.interval = 10,result.type = 'fraction')
##D   
## End(Not run)
  



