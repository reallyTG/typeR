library(bayesdfa)


### Name: find_regimes
### Title: Fit multiple models with differing numbers of regimes to trend
###   data
### Aliases: find_regimes

### ** Examples

data(Nile)
find_regimes(log(Nile), iter = 500, chains = 1, max_regimes = 2)



