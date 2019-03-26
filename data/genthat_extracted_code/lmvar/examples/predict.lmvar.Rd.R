library(lmvar)


### Name: predict.lmvar
### Title: Predictions for model matrices
### Aliases: predict.lmvar

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

# Create the response vector
y = attenu$accel

# Carry out the fit
fit = lmvar(y, X, X_s)

# Calculate the expected values and standard deviations of 'accel'
# for the current magnitudes and distances
predict(fit)

# Calculate the expected values and standard deviations of 'accel' for earthquakes
# with a 10% larger magnitude, at the current distances
XP = cbind(1.1 * attenu$mag, attenu$dist)
colnames(XP) = c("mag", "dist")

XP_s = cbind(1.1 * attenu$mag, 1 / attenu$dist)
colnames(XP_s) = c("mag", "dist_inv")

predict(fit, XP, XP_s)

# Calculate only the expected values
predict(fit, XP, XP_s, sigma = FALSE)

# Calculate only the standard deviations
predict(fit, XP, XP_s, mu = FALSE)

# Calculate the expected values and their 95% confidence intervals
predict(fit, XP, XP_s, sigma = FALSE, interval = "confidence")

# Calculate the standard deviations and their 90% confidence intervals
predict(fit, XP, XP_s, mu = FALSE, interval = "confidence", level = 0.9)

# Calculate the expected values and the 90% prediction intervals of 'accel'
predict(fit, XP, XP_s, sigma = FALSE, interval = "prediction", level = 0.9)

# Change the model and fit the log of 'accel'
y = log(attenu$accel)
fit_log = lmvar(y, X, X_s)

# Calculate the expected values and standard deviations of the log of 'accel'
predict(fit_log, XP, XP_s)

# Calculate the expected values and standard deviations of 'accel'
predict(fit_log, XP, XP_s, log = TRUE)

# Calculate the expected values and standard deviations of 'accel',
# as well as their 99% confidence intervals
predict(fit_log, XP, XP_s, log = TRUE, interval = "confidence", level = 0.99)




