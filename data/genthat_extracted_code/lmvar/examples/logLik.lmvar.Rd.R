library(lmvar)


### Name: logLik.lmvar
### Title: Log-likelihood for an object of class 'lmvar'
### Aliases: logLik.lmvar

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

# Show the log-likelihood and the degrees of freedom of the fit
# using the 'print' method for an object of class 'logLik'
logLik(fit)

# Obtain the log-likelihood itself
logLik(fit)[1]



