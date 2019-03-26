library(msgl)


### Name: parameters.msgl
### Title: Nonzero parameters
### Aliases: parameters.msgl

### ** Examples

data(SimData)


lambda <- msgl::lambda(x, classes, alpha = .5, d = 50, lambda.min = 0.05)
fit <- msgl::fit(x, classes, alpha = .5, lambda = lambda)

# the nonzero parameters of model 1, 10 and 25
parameters(fit)[c(1,10,25)]

# count the number of nonzero parameters in each model
sapply(parameters(fit), sum)




