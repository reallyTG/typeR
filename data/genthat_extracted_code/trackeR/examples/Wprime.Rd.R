library(trackeR)


### Name: Wprime
### Title: W': work capacity above critical power/speed.
### Aliases: Wprime trackeRWprime Based on the critical power model for
###   cycling (Monod and Scherrer, 1965), W' (read W prime) describes
###   finite work capacity above (Skiba et al., 2012). While is depleted
###   during exercise power, it replenished below power. Thus, of interest
###   how much this has been not yet replinished again, named expended, or
###   still available, balance. This principal applied to runners by
###   subsituting with speed speed, respectively

### ** Examples

## Not run: 
##D data('runs', package = 'trackeR')
##D wexp <- Wprime(runs, session = c(11,13), cp = 4, version = '2012')
##D plot(wexp)
## End(Not run)



