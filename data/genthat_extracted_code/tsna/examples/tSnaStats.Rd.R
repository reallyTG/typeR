library(tsna)


### Name: tSnaStats
### Title: Apply the sna package's static graph- and vertex-level network
###   descriptive statistics at multiple time points
### Aliases: tSnaStats

### ** Examples

library(networkDynamicData)
data(harry_potter_support)

# compute triad census scores for each time point
tSnaStats(harry_potter_support,snafun='triad.census')

# compute graph transitivities
tSnaStats(harry_potter_support,snafun='gtrans')
## Not run: 
##D data(concurrencyComparisonNets)
##D # since thes are big nets, with lots of timepoints, 
##D # set time.interval to avoid evaluating every step
##D tSnaStats(base,'prestige',time.interval=25,rescale=TRUE)
##D 
##D # since it is time series, easy to plot
##D plot(tSnaStats(base,'components',time.interval=10))
## End(Not run)



