library(ReIns)


### Name: cEPD
### Title: EPD estimator for right censored data
### Aliases: cEPD

### ** Examples

# Set seed
set.seed(29072016)

# Pareto random sample
X <- rpareto(500, shape=2)

# Censoring variable
Y <- rpareto(500, shape=1)

# Observed sample
Z <- pmin(X, Y)

# Censoring indicator
censored <- (X>Y)

# EPD estimator adapted for right censoring
cepd <- cEPD(Z, censored=censored, plot=TRUE)



