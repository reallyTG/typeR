library(extremis)


### Name: angdensity
### Title: Empirical-Likelihood Based Inference for the Angular Density
### Aliases: angdensity angdensity.default

### ** Examples

## de Carvalho et al (2013, Fig. 7)
data(beatenberg)
attach(beatenberg)
fit <- angdensity(beatenberg, tau = 0.98, nu = 163, raw = FALSE)
plot(fit)
rug(fit$w)



