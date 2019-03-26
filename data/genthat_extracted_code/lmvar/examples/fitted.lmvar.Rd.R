library(lmvar)


### Name: fitted.lmvar
### Title: Fitted values for an 'lmvar' object
### Aliases: fitted.lmvar

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
y = attenu$accel
fit = lmvar(y, X, X_s)

# Calculate the expected value of each observation
fitted(fit, sigma = FALSE)

# Calculate the standard deviation of each observation
fitted(fit, mu = FALSE)

# Calculate the expected values and their 95% confidence intervals
fitted(fit, sigma = FALSE, interval = "confidence")

# Calculate the standard deviations and their 80% confidence intervals
fitted(fit, mu = FALSE, interval = "confidence", level = 0.8)

# Calculate both the expected values and the standard deviations
fitted(fit)

# Calculate the expected values, the standard deviations and their 95% confidence intervals
fitted(fit, interval = "confidence")

# Calculate the expected values and the 90% prediction intervals
fitted(fit, interval = "prediction", level = 0.9)

# Fit the log of 'accel'
y = log(attenu$accel)
fit_log = lmvar(y, X, X_s)

# Calculate both the expected values and the standard deviations of the log of 'accel'
fitted(fit_log)

# Calculate the expected values and the standard deviations of 'accel'
fitted(fit_log, log = TRUE)

# Calculate the expected values and the standard deviations of 'accel',
# as well as their 90% confidence intervals
fitted(fit_log, log = TRUE, interval = "confidence", level = 0.9)





