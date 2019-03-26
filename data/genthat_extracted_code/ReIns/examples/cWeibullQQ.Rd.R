library(ReIns)


### Name: cWeibullQQ
### Title: Weibull quantile plot for right censored data
### Aliases: cWeibullQQ

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

# Weibull QQ-plot adapted for right censoring
cWeibullQQ(Z, censored=censored)



