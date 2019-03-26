library(msgl)


### Name: coef.msgl
### Title: Nonzero coefficients
### Aliases: coef.msgl

### ** Examples

data(SimData)


lambda <- msgl::lambda(x, classes, alpha = .5, d = 50, lambda.min = 0.05)
fit <- msgl::fit(x, classes, alpha = .5, lambda = lambda)

# the nonzero coefficients of the models 1, 10 and 20
coef(fit, index = c(1,10,20))




