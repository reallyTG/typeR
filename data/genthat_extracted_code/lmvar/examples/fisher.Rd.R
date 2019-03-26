library(lmvar)


### Name: fisher
### Title: Fisher information matrix for an object of class 'lmvar'
### Aliases: fisher

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

# The complete Fisher information matrix is
fisher(fit)

# The left-upper block matrix relating to the expected values is
fisher(fit, sigma = FALSE)

# The right-lower block matrix relating to the variances is
fisher(fit, mu = FALSE)



