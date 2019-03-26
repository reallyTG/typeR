library(surveyplanning)


### Name: min_count
### Title: Minimal count of respondents for the given relative margin of
###   error
### Aliases: min_count
### Keywords: surveyplanning

### ** Examples


min_count(n = 15e3, pop = 2e6, RMoE = 0.1)

## Not run: 
##D 
##D min_count(n = c(10e3, 15e3, 20e3), pop = 2e6, 0.1)
##D 
##D n <- seq(10e3, 30e3, length.out = 11)
##D # n <- sort(c(n, 22691))
##D n
##D 
##D RMoE <- seq(.02, .2, length.out = 10)
##D RMoE
##D 
##D dt <- data.table(n = rep(n, each = length(RMoE)), RMoE = RMoE)
##D dt[, Y := min_count(n = n, pop = 2.1e6, RMoE = RMoE, R = 1) / 1e3]
##D dt
## End(Not run)




