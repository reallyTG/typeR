library(countfitteR)


### Name: fit_counts
### Title: Function that fits counts to distribution models.
### Aliases: fit_counts

### ** Examples

df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
fit_counts(df, model = "pois") 



