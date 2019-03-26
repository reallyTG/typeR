library(ReIns)


### Name: cExpQQ
### Title: Exponential quantile plot for right censored data
### Aliases: cExpQQ

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

# Exponential QQ-plot adapted for right censoring
cExpQQ(Z, censored=censored)



