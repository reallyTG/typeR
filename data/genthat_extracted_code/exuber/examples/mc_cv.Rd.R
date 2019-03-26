library(exuber)


### Name: mc_cv
### Title: Monte Carlo Critical Values
### Aliases: mc_cv

### ** Examples

## No test: 
# Default minimum window
mc <- mc_cv(n = 100)

# Change the minimum window and the number of simulations
mc <- mc_cv(n = 100, nrep = 2500,  minw = 20)

# Use parallel computing (utilizing all available cores)
mc <- mc_cv(n = 100, parallel = TRUE)
## End(No test)



