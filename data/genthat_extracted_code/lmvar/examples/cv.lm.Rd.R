library(lmvar)


### Name: cv.lm
### Title: Cross-validation for an object of class 'lm'
### Aliases: cv.lm

### ** Examples

# Create an object of class 'lm'. We use a model matrix obtained from the 'cats' dataframe,
# an arbitrary parameter vector beta and a generated response vector y for the purpose of the
# example.
library(MASS)

X = model.matrix(~ Sex + Bwt, cats)
beta_mu = c(-0.1, 0.3, 4)

mu = X %*% beta_mu

y = rnorm( nrow(X), mean = mu, sd = 0.5)

fit = lm(y ~ ., as.data.frame(X[,-1]), x = TRUE, y = TRUE)

# Carry out a cross-validation
## No test: 
cv.lm(fit)
## End(No test)   ## Don't show: 
# will fail test on CRAN when using more than 2 CPU-cores
## End(Don't show)

# Carry out a cross-validation using a single CPU-core
cv.lm(fit, max_cores = 1)

# Carry out a cross-validation including a Kolmogorov-Smirnov test, using at most two CPU-cores
cv.lm(fit, ks_test = TRUE, max_cores = 2)

# Carry out a cross-validation with 5 folds and control the random numbers used
cv.lm(fit, k = 5, seed = 5483, max_cores = 1)

## No test: 
# Calculate cross-validation results for the fourth moment of the residuals, using a
# user-specified function
fourth = function(object, y, X){
  mu = predict(object, as.data.frame(X))
  residuals = y - mu
  return(mean(residuals^4))
}
cv.lm(fit, fun = fourth)
rm(fourth)

# Use option 'log = TRUE' if you fit the log of the response vector and require error estimates for
# the response vector itself
fit = lm(log(y) ~ ., as.data.frame(X[,-1]), x = TRUE, y = TRUE)
cv = cv.lm(fit, log = TRUE)

# Print 'cv' using the print-method print.cvlmvar
cv

# Print 'cv' with a specified number of digits
print(cv, digits = 2)
## End(No test)



