library(errors)


### Name: errors-package
### Title: 'errors': Uncertainty Propagation for R Vectors
### Aliases: errors-package

### ** Examples

## Simultaneous resistance and reactance measurements

# Obtain mean values and uncertainty from measured values
V   <- mean(set_errors(GUM.H.2$V))
I   <- mean(set_errors(GUM.H.2$I))
phi <- mean(set_errors(GUM.H.2$phi))

# Set correlations between variables
correl(V, I)   <- with(GUM.H.2, cor(V, I))
correl(V, phi) <- with(GUM.H.2, cor(V, phi))
correl(I, phi) <- with(GUM.H.2, cor(I, phi))

# Computation of resistance, reactance and impedance values
(R <- (V / I) * cos(phi))
(X <- (V / I) * sin(phi))
(Z <- (V / I))

# Correlations between derived quantities
correl(R, X)
correl(R, Z)
correl(X, Z)

## Calibration of a thermometer

# Least-squares fit for a reference temperature of 20 degC
fit <- lm(bk ~ I(tk - 20), data = GUM.H.3)

# Extract coefficients and set correlation using the covariance matrix
y1 <- set_errors(coef(fit)[1], sqrt(vcov(fit)[1, 1]))
y2 <- set_errors(coef(fit)[2], sqrt(vcov(fit)[2, 2]))
covar(y1, y2) <- vcov(fit)[1, 2]

# Predicted correction for 30 degC
(b.30 <- y1 + y2 * set_errors(30 - 20))




