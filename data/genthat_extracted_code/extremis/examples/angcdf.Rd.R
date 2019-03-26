library(extremis)


### Name: angcdf
### Title: Empirical-Likelihood Based Inference for the Angular Measure
### Aliases: angcdf angcdf.default

### ** Examples

## de Carvalho et al (2013, Fig. 7)
data(beatenberg)
attach(beatenberg)
fit <- angcdf(beatenberg, tau = 0.98, raw = FALSE)
plot(fit)
rug(fit$w)



