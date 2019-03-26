library(msgl)


### Name: fit
### Title: Fit a multinomial sparse group lasso regularization path.
### Aliases: fit

### ** Examples

data(SimData)

# A quick look at the data
dim(x)
table(classes)
# Fit multinomial sparse group lasso regularization path
# using a lambda sequence ranging from the maximal lambda to 0.5 * maximal lambda

fit <- msgl::fit(x, classes, alpha = 0.5, lambda = 0.5)

# Print some information about the fit
fit

# Model 10, i.e. the model corresponding to lambda[10]
models(fit)[[10]]

# The nonzero features of model 10
features(fit)[[10]]

# The nonzero parameters of model 10
parameters(fit)[[10]]

# The training errors of the models.
Err(fit, x)
# Note: For high dimensional models the training errors are almost always over optimistic,
# instead use msgl::cv to estimate the expected errors by cross validation




