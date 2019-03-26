library(countfitteR)


### Name: compare_fit
### Title: Compare distributions
### Aliases: compare_fit

### ** Examples

df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
compare_fit(df, fitlist = fit_counts(df, model = "all"))



