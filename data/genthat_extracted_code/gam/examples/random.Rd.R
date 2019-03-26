library(gam)


### Name: random
### Title: Specify a Random Effects Fit in a GAM Formula
### Aliases: random gam.random
### Keywords: models regression nonparametric smooth random effects mixed
###   effects

### ** Examples

# fit a model with a linear term in Age and a random effect in the factor Level
y ~ Age + random(Level, lambda=1)
 


