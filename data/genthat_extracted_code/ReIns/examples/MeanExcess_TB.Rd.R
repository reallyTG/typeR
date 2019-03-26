library(ReIns)


### Name: MeanExcess_TB
### Title: Mean excess function using Turnbull estimator
### Aliases: MeanExcess_TB

### ** Examples

# Pareto random sample
X <- rpareto(500, shape=2)

# Censoring variable
Y <- rpareto(500, shape=1)

# Observed sample
Z <- pmin(X, Y)

# Censoring indicator
censored <- (X>Y)

# Right boundary
U <- Z
U[censored] <- Inf

# Mean excess plot
MeanExcess_TB(Z, U, censored, k=FALSE)



