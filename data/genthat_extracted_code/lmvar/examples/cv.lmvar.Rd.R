library(lmvar)


### Name: cv.lmvar
### Title: Cross-validation for an object of class 'lmvar'
### Aliases: cv.lmvar

### ** Examples

# Create an object of class 'lmvar'. We use a model matrix obtained from the 'cats' dataframe,
# arbitrary parameter vectors beta and a generated response vector y for the purpose of the
# example.

## No test: 
library(MASS)

X = model.matrix(~ Sex + Bwt, cats)
beta_mu = c(-0.1, 0.3, 4)
beta_sigma = c(-0.5, -0.1, 0.3)

mu = X %*% beta_mu
log_sigma = X %*% beta_sigma

y = rnorm( nrow(X), mean = mu, sd = exp(log_sigma))

fit = lmvar(y, X_mu = X[,-1], X_sigma = X[,-1])

# Carry out a cross-validation
cv.lmvar(fit)     ## Don't show: 
# will fail test on CRAN when using more than 2 CPU-cores
## End(Don't show)

# Carry out a cross-validation using a single CPU-core
cv.lmvar(fit, max_cores = 1)

# Carry out a cross-validation including a Kolmogorov-Smirnov test, using at most two CPU-cores
cv.lmvar(fit, ks_test = TRUE, max_cores = 2)

# Carry out a cross-validation with 5 folds and control the random numbers used
cv.lmvar(fit, k = 5, seed = 5483, max_cores = 1)

# Carry out a cross-validation and exclude observations 5, 11 and 20 from the calculation of
# the error statistics
cv.lmvar(fit, exclude = c(5, 11, 20), max_cores = 1)

# Calculate cross-validation results for the fourth moment of the residuals, using a
# user-specified function
fourth = function(object, y, X_mu, X_sigma){
  mu = predict(object, X_mu[,-1], X_sigma[,-1], sigma = FALSE)
  residuals = y - mu
  return(mean(residuals^4))
}
cv.lmvar(fit, fun = fourth)
rm(fourth)

# Carry out a cross-validation and specify the maximization routine and maximum number of iterations
cv.lmvar(fit, slvr_options = list( method = "NR", control = list(iterlim = 500)))

# Use option 'log = TRUE' if you fit the log of the response vector and require error estimates for
# the response vector itself
fit = lmvar(log(y), X_mu = X[,-1], X_sigma = X[,-1])
cv = cv.lmvar(fit, log = TRUE)

# Print 'cv' using the print-method print.cvlmvar
cv

# Print 'cv' with a specified number of digits
print(cv, digits = 2)
## End(No test)



