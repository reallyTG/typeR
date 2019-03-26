library(lmvar)


### Name: lmvar_no_fit
### Title: Create an 'lmvar'-like object without a model fit
### Aliases: lmvar_no_fit

### ** Examples

# As example we sue the dataset 'iris' from the library 'datasets'
library(datasets)

# Create the model matrix for both the expected values and the standard deviations
X = model.matrix( ~ Species - 1, data = iris)

# Take as response variabe the variable Sepal.length
y = iris$Sepal.Length

# Construct a 'lmvar_no_fit' object
no_fit = lmvar_no_fit( y, X, X)

# The following functions all work on such an object
nobs(no_fit)
dfree(no_fit)
alias(no_fit)

# You can also supply 'lmvar' arguments
no_fit = lmvar_no_fit( y, X[,-1], X[,-1], intercept_mu = FALSE, intercept_sigma = FALSE)
dfree(no_fit)

# Some (most) arguments have no effect except that they are stored in the 'lmvar_no_fit'
# object
no_fit = lmvar_no_fit( y, X, X, control = list( slvr_log = TRUE, remove_df_sigma = TRUE))
no_fit$control



