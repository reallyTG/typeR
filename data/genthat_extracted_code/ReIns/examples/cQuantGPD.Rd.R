library(ReIns)


### Name: cQuantGPD
### Title: Estimator of large quantiles using censored GPD-MLE
### Aliases: cQuantGPD

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

# GPD-MLE estimator adapted for right censoring
cpot <- cGPDmle(Z, censored=censored, plot=TRUE)

# Large quantile
p <- 10^(-4)
cQuantGPD(Z, gamma1=cpot$gamma1, sigma1=cpot$sigma1,
         censored=censored, p=p, plot=TRUE)



