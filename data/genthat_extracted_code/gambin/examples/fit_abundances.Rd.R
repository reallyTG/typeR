library(gambin)


### Name: fit_abundances
### Title: Fit a unimodal or multimodal gambin model to a species abundance
###   distribution
### Aliases: fit_abundances fitGambin

### ** Examples

data(moths)
fit = fit_abundances(moths)
barplot(fit)
lines(fit, col=2)
summary(fit)
# gambin parameters based on a standardized sample size of 1000 individuals
stand_fit <- replicate(20, fit_abundances(moths, 1000)$alpha) #may take a while on slower computers
print(c(mean = mean(stand_fit), sd = sd(stand_fit)))
# a bimodal gambin model
biMod <- fit_abundances(moths, no_of_components = 2)



