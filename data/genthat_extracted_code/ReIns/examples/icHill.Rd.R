library(ReIns)


### Name: icHill
### Title: Hill estimator for interval censored data
### Aliases: icHill

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

# Hill estimator adapted for interval censoring
icHill(Z, U, censored, ylim=c(0,1))

# Hill estimator adapted for right censoring
cHill(Z, censored, lty=2, add=TRUE)

# True value of gamma
abline(h=1/2, lty=3, col="blue")

# Legend
legend("topright", c("icHill", "cHill"), lty=1:2)



