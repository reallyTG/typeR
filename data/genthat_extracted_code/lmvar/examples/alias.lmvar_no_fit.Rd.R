library(lmvar)


### Name: alias.lmvar_no_fit
### Title: Aliased coefficients in an 'lmvar' object
### Aliases: alias.lmvar_no_fit

### ** Examples

# Create matrix columns
my_intercept = rep(1, 20)
v1 = c(rep(1, 10), rep(0, 10))
v2 = c(rep(0, 10), rep(1, 10))

# Create model matrices
X = cbind(my_intercept, v1, v2)
X_s = X

# Rename the last column of the model matrix 'X_s' to make this example more clear.
colnames(X_s)[3] = "v3"

# Create response vector
y = rnorm(20)

# Perform fit
fit = lmvar(y, X, X_s)

# The column 'my_intercept' is identical to '(Intercept)' added by 'lmvar'
# to the model matrix 'X'. Column 'v2' is equal to '(Intercept)' minus 'v1'.
# The same holds for the model matrix 'X_s'.
alias(fit)

# The aliased columns are left out if you extract the coefficients from a summary
coef(summary(fit))

# Only return the aliased colums in the model matrix for the expectation values
alias(fit, sigma = FALSE)

# Only return the aliased colums in the model matrix for the standard deviations
alias(fit, mu = FALSE)

# It also works on an object of class 'lmvar_no_fit'
no_fit = lmvar_no_fit(y, X, X_s)
alias(no_fit, mu = FALSE)



