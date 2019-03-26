library(coda)


### Name: trellisplots
### Title: Trellis plots for mcmc objects
### Aliases: densityplot.mcmc levelplot.mcmc qqmath.mcmc xyplot.mcmc
###   densityplot.mcmc.list levelplot.mcmc.list qqmath.mcmc.list
###   xyplot.mcmc.list acfplot acfplot.mcmc acfplot.mcmc.list
### Keywords: hplot

### ** Examples

data(line)

## Not run: 
##D xyplot(line)
##D xyplot(line[[1]], start = 10)
##D densityplot(line, start = 10)
##D qqmath(line, start = 10)
##D levelplot(line[[2]])
##D acfplot(line, outer = TRUE)
## End(Not run)



