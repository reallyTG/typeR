library(lmvar)


### Name: coef.lmvar
### Title: Extracts coefficients from an 'lmvar' object.
### Aliases: coef.lmvar

### ** Examples

# As example we use the dataset 'attenu' from the library 'datasets'. The dataset contains
# the response variable 'accel' and two explanatory variables 'mag'  and 'dist'.
library(datasets)

# Create the model matrix for the expected values
X = cbind(attenu$mag, attenu$dist, attenu$mag + attenu$dist)
colnames(X) = c("mag", "dist", "mag+dist")

# Create the model matrix for the standard deviations.
X_s = cbind(attenu$mag, 1 / attenu$dist)
colnames(X_s) = c("mag", "dist_inv")

# Carry out the fit
fit = lmvar(attenu$accel, X, X_s)

# Extract all coefficients
coef(fit)

# Extract only the coefficients corresponding to the (non-aliased)
# columns in the model matrix for the expected values
coef(fit, sigma = FALSE)

# Extract only the coefficients corresponding to the (non-aliased)
# columns in the model matrix for standard deviations
coef(fit, mu = FALSE)



