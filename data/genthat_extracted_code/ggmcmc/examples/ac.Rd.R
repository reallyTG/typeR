library(ggmcmc)


### Name: ac
### Title: Calculate the autocorrelation of a single chain, for a specified
###   amount of lags
### Aliases: ac

### ** Examples

# Calculate the autocorrelation of a simple vector
ac(cumsum(rnorm(10))/10, nLags=4)



