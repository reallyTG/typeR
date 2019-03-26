library(drc)


### Name: W1.2
### Title: The two-parameter Weibull functions
### Aliases: W1.2 w2 W2.2
### Keywords: models nonlinear

### ** Examples


## Fitting a two-parameter Weibull model
earthworms.m1 <- drm(number/total~dose, weights = total,
data = earthworms, fct = W1.2(), type = "binomial")

summary(earthworms.m1)




