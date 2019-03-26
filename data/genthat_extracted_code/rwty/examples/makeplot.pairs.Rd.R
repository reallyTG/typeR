library(rwty)


### Name: makeplot.pairs
### Title: Plotting parameters against each other
### Aliases: makeplot.pairs
### Keywords: convergence, mcmc, parameter, phylogenetics plot,

### ** Examples

## Not run: 
##D data(salamanders)
##D makeplot.pairs(salamanders[1], burnin=20)
##D 
##D # plot all the variables
##D makeplot.pairs(salamanders[1], burnin=20, params = 'all')
##D 
##D # plot specific the variables (note: you always get the topological distance)
##D makeplot.pairs(salamanders[1], burnin=20, params = c('pi.A.', 'pi.C.', 'pi.G.', 'pi.T.'))
## End(Not run)



