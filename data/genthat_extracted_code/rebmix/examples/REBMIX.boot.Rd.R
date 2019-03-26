library(rebmix)


### Name: boot-methods
### Title: Parametric or Nonparametric Bootstrap for Standard Error and
###   Coefficient of Variation Estimation
### Aliases: boot boot-methods boot,REBMIX-method boot,REBMVNORM-method
###   show,REBMIX.boot-method show,REBMVNORM.boot-method
###   summary,REBMIX.boot-method summary,REBMVNORM.boot-method
### Keywords: bootstrap

### ** Examples

data("weibull")

n <- nrow(weibull)

# Number of classes or nearest neighbours to be processed.

K <- c(as.integer(1 + log2(n)), # Minimum v follows Sturges rule.
  as.integer(10 * log10(n))) # Maximum v follows log10 rule.

# Estimate number of components, component weights and component parameters.

weibullest <- REBMIX(Dataset = list(weibull),
  Preprocessing = "kernel density estimation",
  cmax = 4,
  Criterion = "BIC",
  pdf = "Weibull",
  K = K[1]:K[2],
  Restraints = "loose")

# Plot finite mixture.

plot(weibullest, what = c("density", "distribution", "IC", "logL", "D"),
  nrow = 3, ncol = 2, npts = 1000)

# Bootstrap finite mixture.

weibullboot <- boot(x = weibullest, Bootstrap = "nonparametric", B = 10)

weibullboot



