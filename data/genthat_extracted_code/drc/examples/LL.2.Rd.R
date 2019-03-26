library(drc)


### Name: LL.2
### Title: The two-parameter log-logistic function
### Aliases: LL.2 l2 LL2.2
### Keywords: models nonlinear

### ** Examples


## Fitting a two-parameter logistic model 
##  to binomial responses (a logit model)
earthworms.m1 <- drm(number/total~dose, weights=total, 
data = earthworms, fct = LL.2(), type = "binomial")

plot(earthworms.m1)  # not fitting at the upper limit!




