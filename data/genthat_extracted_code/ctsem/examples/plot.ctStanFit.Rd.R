library(ctsem)


### Name: plot.ctStanFit
### Title: plot.ctStanFit
### Aliases: plot.ctStanFit ctStanPlot

### ** Examples

plot(ctstantestfit,types=c('regression','kalman','priorcheck'))

## Not run: 
##D ### complete example
##D plot(ctstantestfit)
##D 
##D #### example plot using rstan functions
##D rstan::stan_trace(ctstantestfit$stanfit, 
##D pars=ctStanParnames(ctstantestfit,'pop_DRIFT'))
## End(Not run)



