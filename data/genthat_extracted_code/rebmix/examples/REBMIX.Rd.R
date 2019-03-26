library(rebmix)


### Name: REBMIX-methods
### Title: REBMIX Algorithm for Univariate or Multivariate Finite Mixture
###   Estimation
### Aliases: REBMIX REBMIX-methods REBMIX,REBMIX-method
###   REBMIX,REBMVNORM-method show,REBMIX-method show,REBMVNORM-method
###   summary,REBMIX-method summary,REBMVNORM-method
### Keywords: parameter estimation

### ** Examples

# Generate and plot univariate normal dataset.

n <- c(998, 263, 1086, 487)

Theta <- new("RNGMIX.Theta", c = 4, pdf = "normal")

a.theta1(Theta) <- c(688, 265, 30, 934)
a.theta2(Theta) <- c(72, 54, 34, 28)

normal <- RNGMIX(Dataset.name = "complex1",
  rseed = -1,
  n = n,
  Theta = a.Theta(Theta))

normal

a.Dataset(normal, 1)[1:20,]

# Estimate number of components, component weights and component parameters.

normalest <- REBMIX(Dataset = a.Dataset(normal),
  Preprocessing = "h",
  cmax = 8,
  Criterion = "BIC",
  pdf = "n")

normalest

BIC(normalest)

logL(normalest)

# Plot finite mixture.

plot(normalest, nrow = 2, what = c("den", "dis"), npts = 1000)



