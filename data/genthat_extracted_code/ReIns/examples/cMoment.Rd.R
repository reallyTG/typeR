library(ReIns)


### Name: cMoment
### Title: MOM estimator for right censored data
### Aliases: cMoment

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



