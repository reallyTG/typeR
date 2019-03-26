library(lmvar)


### Name: dfree
### Title: Degrees of freedom for an object of class 'lmvar'
### Aliases: dfree

### ** Examples

# As example we use the dataset 'attenu' from the library 'datasets'. The dataset contains
# the response variable 'accel' and two explanatory variables 'mag'  and 'dist'.
library(datasets)

# Create the model matrix for the expected values
X = cbind(attenu$mag, attenu$dist)
colnames(X) = c("mag", "dist")

# Create the model matrix for the standard deviations.
X_s = cbind(attenu$mag, 1 / attenu$dist)
colnames(X_s) = c("mag", "dist_inv")

# Carry out the fit
fit = lmvar(attenu$accel, X, X_s)

# The degrees of freedom are
dfree(fit)

# The degrees of freedom of the expected values are
dfree(fit, sigma = FALSE)

# The degrees of freedom of the standard deviations are
dfree(fit, mu = FALSE)

# Function also works on object of class 'lmvar_no_fit'
no_fit = lmvar_no_fit(attenu$accel, X, X_s)
dfree(no_fit)



