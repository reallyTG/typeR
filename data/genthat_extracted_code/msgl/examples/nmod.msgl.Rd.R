library(msgl)


### Name: nmod.msgl
### Title: Number of models used for fitting
### Aliases: nmod.msgl

### ** Examples

data(SimData)


lambda <- msgl::lambda(x, classes, alpha = .5, d = 50, lambda.min = 0.05)
fit <- msgl::fit(x, classes, alpha = .5, lambda = lambda)

# the number of models
nmod(fit)




