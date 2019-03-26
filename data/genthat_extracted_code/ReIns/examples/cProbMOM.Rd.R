library(ReIns)


### Name: cProbMOM
### Title: Estimator of small exceedance probabilities and large return
###   periods using censored MOM
### Aliases: cProbMOM cReturnMOM

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

# Moment estimator adapted for right censoring
cmom <- cMoment(Z, censored=censored, plot=TRUE)

# Small exceedance probability
q <- 10
cProbMOM(Z, censored=censored, gamma1=cmom$gamma1, q=q, plot=TRUE)

# Return period
cReturnMOM(Z, censored=censored, gamma1=cmom$gamma1, q=q, plot=TRUE)



