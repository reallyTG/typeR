library(rstantools)


### Name: predictive_interval
### Title: Generic function for predictive intervals
### Aliases: predictive_interval predictive_interval.default

### ** Examples

# Default method takes a numeric matrix (of draws from posterior
# predictive distribution)
ytilde <- matrix(rnorm(100 * 5, sd = 2), 100, 5) # fake draws
predictive_interval(ytilde, prob = 0.8)

# Also see help("predictive_interval", package = "rstanarm")




