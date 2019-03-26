library(apricom)


### Name: sse
### Title: Sum of Square Errors
### Aliases: sse

### ** Examples

## Using simulated data derived from the iris dataset
mu <- c(rep(0, 4))
covmatr <- matrix(c(0.7, -0.04, 1.3, 0.5, -0.04, 0.2, -0.3, -0.1,
1.3, -0.3, 3.1, 1.3, 0.5, -0.1, 1.3, 0.6), ncol = 4)
sim.dat <- randnor(n = 100, mu = mu, Cov = covmatr)
sim.dat <- cbind(1, sim.dat)
## resample and fit an ordinary least squares model, and then
## calculate the sum of square errors of the model when applied
## to the original data
sim.boot <- randboot(sim.dat, replace = TRUE)
boot.betas <- ols.rgr(sim.boot)
sse(b = boot.betas, dataset = sim.dat)



