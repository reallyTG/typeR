library(ReIns)


### Name: icParetoQQ
### Title: Pareto quantile plot for interval censored data
### Aliases: icParetoQQ

### ** Examples

# Pareto random sample
X <- rpareto(500, shape=2)

# Censoring variable
Y <- rpareto(500, shape=1)

# Observed sample
Z <- pmin(X,Y)

# Censoring indicator
censored <- (X>Y)

# Right boundary
U <- Z
U[censored] <- Inf

# Pareto QQ-plot adapted for interval censoring
icParetoQQ(Z, U, censored)

# Pareto QQ-plot adapted for right censoring
cParetoQQ(Z, censored)



