library(countfitteR)


### Name: plot_fitcmp
### Title: plot_fitcmp
### Aliases: plot_fitcmp

### ** Examples

df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
fitcmp <- compare_fit(df, fitlist = fit_counts(df, model = "all"))
plot_fitcmp(fitcmp)



