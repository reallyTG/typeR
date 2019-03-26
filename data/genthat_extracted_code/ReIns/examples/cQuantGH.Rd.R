library(ReIns)


### Name: cQuantGH
### Title: Estimator of large quantiles using censored Hill
### Aliases: cQuantGH

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

# Generalised Hill estimator adapted for right censoring
cghill <- cgenHill(Z, censored=censored, plot=TRUE)

# Large quantile
p <- 10^(-4)
cQuantGH(Z, gamma1=cghill$gamma, censored=censored, p=p, plot=TRUE)



