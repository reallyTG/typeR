library(ReIns)


### Name: cQuant
### Title: Estimator of large quantiles using censored Hill
### Aliases: cQuant

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

# Hill estimator adapted for right censoring
chill <- cHill(Z, censored=censored, plot=TRUE)

# Large quantile
p <- 10^(-4)
cQuant(Z, gamma1=chill$gamma, censored=censored, p=p, plot=TRUE)



