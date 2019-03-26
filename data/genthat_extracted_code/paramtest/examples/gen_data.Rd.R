library(paramtest)


### Name: gen_data
### Title: Generate data through a factor matrix and effects matrix.
### Aliases: gen_data

### ** Examples

# two uncorrelated predictors, one criterion, with measurement error in all
# variables
beta1 <- .5
beta2 <- .6
y_resid_var <- sqrt(1 - (beta1^2 + beta2^2))
fmodel <- matrix(
    c(.8, 0, 0,   # x1
      0, .6, 0,   # x2
      0, 0, .5),  # y
    nrow=3, ncol=3, byrow=TRUE, dimnames=list(
    c('x1', 'x2', 'y'), c('x1', 'x2', 'y')))
    # in this case, observed and latent variables are the same
effects <- matrix(
    c(1, 0, beta1,
      0, 1, beta2,
      0, 0, y_resid_var),
    nrow=3, ncol=3, byrow=TRUE, dimnames=list(
    c('x1', 'x2', 'y'), c('x1', 'x2', 'y')))

sample_data <- gen_data(fmodel, effects, n_cases=1000)
round(var(sample_data), 2)
round(cor(sample_data), 2)
summary(lm(y ~ x1 + x2, data=sample_data))
    # note that beta coefficients are much smaller, due to measurement error



