library(lmvar)


### Name: lmvar
### Title: Linear regression with non-constant variances
### Aliases: lmvar

### ** Examples

# As example we use the dataset 'attenu' from the library 'datasets'. The dataset contains
# the response variable 'accel' and two explanatory variables 'mag'  and 'dist'.
library(datasets)

# For more info on the data, study the dataset
help("attenu")

# Create the model matrix for the expected values
X = cbind(attenu$mag, attenu$dist)
colnames(X) = c("mag", "dist")

# Create the model matrix for the standard deviations. The standard deviation
# is large for small distances and small for large distances. The use of 'dist'
# as explanatory variable makes the beta for the intercept term blow up.
# Therefore we use '1 / dist' as explanatory variable
X_s = cbind(attenu$mag, 1 / attenu$dist)
colnames(X_s) = c("mag", "dist_inv")

# Carry out the fit
fit = lmvar(attenu$accel, X, X_s)

# Inspect the results
summary(fit)

# Carry out the fit with an inital estimate for beta and ask for
# a report of the solver-routine
beta_sigma_start = c(-4, 0, 0)
fit = lmvar(attenu$accel, X, X_s,
            slvr_options = list(start = beta_sigma_start),
            control = list(slvr_log = TRUE))
fit$slvr_log



