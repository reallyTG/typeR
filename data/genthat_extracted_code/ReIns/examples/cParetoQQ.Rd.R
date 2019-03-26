library(ReIns)


### Name: cParetoQQ
### Title: Pareto quantile plot for right censored data
### Aliases: cParetoQQ

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

# Pareto QQ-plot adapted for right censoring
cParetoQQ(Z, censored=censored)



