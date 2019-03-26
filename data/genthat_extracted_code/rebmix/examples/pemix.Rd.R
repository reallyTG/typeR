library(rebmix)


### Name: pemix-methods
### Title: Empirical Distribution Function Calculation
### Aliases: pemix pemix-methods pemix,REBMIX-method pemix,REBMVNORM-method
### Keywords: distributions

### ** Examples

# Generate simulated dataset.

n <- c(15, 15)

Theta <- new("RNGMIX.Theta", c = 2, pdf = rep("normal", 3))

a.theta1(Theta, 1) <- c(10, 20, 30)
a.theta1(Theta, 2) <- c(3, 4, 5)
a.theta2(Theta, 1) <- c(3, 2, 1)
a.theta2(Theta, 2) <- c(15, 10, 5)

simulated <- RNGMIX(Dataset.name = paste("simulated_", 1:4, sep = ""),
  rseed = -1,
  n = n,
  Theta = a.Theta(Theta))

# Number of classes or nearest neighbours to be processed.

K <- c(as.integer(1 + log2(sum(n))), # Minimum v follows Sturges rule.
  as.integer(10 * log10(sum(n)))) # Maximum v follows log10 rule.

# Estimate number of components, component weights and component parameters.

simulatedest <- REBMIX(Dataset = a.Dataset(simulated),
  Preprocessing = "kernel density estimation",
  cmax = 4,
  Criterion = "BIC",
  pdf = c("n", "n", "n"),
  K = K[1]:K[2])

# Preprocess simulated dataset.

f <- pemix(simulatedest, pos = 3, variables = c(1, 2))

f

# Plot finite mixture.

opar <- plot(simulatedest, pos = 3, nrow = 3, ncol = 1, what = "dist")

par(usr = opar[[1]]$usr, mfg = c(1, 1))

text(x = f[20:25, 1], y = f[20:25, 2], labels = format(f[20:25, 3],
  digits = 3), cex = 0.8, pos = 1)



