library(ReIns)


### Name: cLognormalQQ
### Title: Log-normal quantile plot for right censored data
### Aliases: cLognormalQQ

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

# Log-normal QQ-plot adapted for right censoring
cLognormalQQ(Z, censored=censored)



