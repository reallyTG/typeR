library(lmvar)


### Name: summary.lmvar
### Title: Summary overview for an object of class 'lmvar'
### Aliases: summary.lmvar

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

# Print a summary of the fit
summary(fit)

# Include only the coefficients beta for the expected values
summary(fit, sigma = FALSE)

# Include only the coefficients beta for the standard deviations
summary(fit, mu = FALSE)

# Extract the matrix of coefficients from the summary
coef(summary(fit))



