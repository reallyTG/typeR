library(ReIns)


### Name: cQuantMOM
### Title: Estimator of large quantiles using censored MOM
### Aliases: cQuantMOM

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

# Large quantile
p <- 10^(-4)
cQuantMOM(Z, censored=censored, gamma1=cmom$gamma1, p=p, plot=TRUE)



