library(tsna)


### Name: tErgmStats
### Title: Calculate network summary statistics at multiple time points
### Aliases: tErgmStats

### ** Examples

 ## Not run: 
##D  data(windsurfers)
##D  tErgmStats(windsurfers,'~edges+degree(c(1,2))')
##D  library(networkDynamicData)
##D  data(concurrencyComparisonNets)
##D  tErgmStats(base,'~edges+concurrent',
##D                start=0,end=100,time.interval = 10)
##D  # show as multiple plots
##D  plot(
##D    tErgmStats(base,'~edges+concurrent',
##D                 start=0,end=100,time.interval = 10),
##D                 
##D                 )
##D   
## End(Not run)

 



