library(ReIns)


### Name: cProbEPD
### Title: Estimator of small exceedance probabilities and large return
###   periods using censored EPD
### Aliases: cProbEPD cReturnEPD

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

# Small exceedance probability
q <- 10
cProbEPD(Z, censored=censored, gamma1=cepd$gamma1,
        kappa1=cepd$kappa1, beta=cepd$beta, q=q, plot=TRUE)

# Return period
cReturnEPD(Z, censored=censored, gamma1=cepd$gamma1,
        kappa1=cepd$kappa1, beta=cepd$beta, q=q, plot=TRUE)        



