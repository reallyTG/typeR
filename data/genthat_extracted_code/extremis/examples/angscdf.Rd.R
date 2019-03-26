library(extremis)


### Name: angscdf
### Title: Smooth Empirical-Likelihood Based Inference for the Angular
###   Measure
### Aliases: angscdf angscdf.default

### ** Examples

## de Carvalho et al (2013, Fig. 7)
data(beatenberg)
attach(beatenberg)
fit <- angscdf(beatenberg, tau = 0.98, nu = 163, raw = FALSE)
plot(fit)
rug(fit$w)



