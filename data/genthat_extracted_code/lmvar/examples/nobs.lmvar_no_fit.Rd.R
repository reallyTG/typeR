library(lmvar)


### Name: nobs.lmvar_no_fit
### Title: Number of observations for an object of class 'lmvar'
### Aliases: nobs.lmvar_no_fit

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

# Return the number of observations in the fit
nobs(fit)

# Check that this is equal to the number of observations in the dataset
nobs(fit) == nrow(attenu)

# Function also works on object of class 'lmvar_no_fit'
no_fit = lmvar_no_fit(attenu$accel, X, X_s)
nobs(no_fit)




