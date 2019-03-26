library(rebmix)


### Name: RCLRMIX-methods
### Title: Predicts Cluster Membership Based Upon a Model Trained by REBMIX
### Aliases: RCLRMIX RCLRMIX-methods RCLRMIX,RCLRMIX-method
###   RCLRMIX,RCLRMVNORM-method show,RCLRMIX-method show,RCLRMVNORM-method
###   summary,RCLRMIX-method summary,RCLRMVNORM-method
### Keywords: clustering

### ** Examples

devAskNewPage(ask = TRUE)

# Generate Poisson dataset.

n <- c(500, 200, 400)

Theta <- new("RNGMIX.Theta", c = 3, pdf = "Poisson")

a.theta1(Theta) <- c(3, 12, 36)

poisson <- RNGMIX(Dataset.name = "Poisson_1", n = n, Theta = a.Theta(Theta))

# Estimate number of components, component weights and component parameters.

poissonest <- REBMIX(Dataset = a.Dataset(poisson),
  Preprocessing = "histogram",
  cmax = 6,
  Criterion = "BIC",
  pdf = rep("Poisson", 1),
  K = 1)

summary(poissonest)

# Plot finite mixture.

plot(poissonest)

# Cluster dataset.

poissonclu <- RCLRMIX(x = poissonest, Zt = a.Zt(poisson))

summary(poissonclu)

# Plot clusters.

plot(poissonclu)

summary(poissonclu)



