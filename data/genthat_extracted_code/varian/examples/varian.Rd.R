library(varian)


### Name: varian
### Title: Variablity Analysis using a Bayesian Variability Model (VM)
### Aliases: varian varian-package
### Keywords: models

### ** Examples

## Not run: 
##D   sim.data <- with(simulate_gvm(4, 60, 0, 1, 3, 2, 94367), {
##D     set.seed(265393)
##D     x2 <- MASS::mvrnorm(k, c(0, 0), matrix(c(1, .3, .3, 1), 2))
##D     y2 <- rnorm(k, cbind(Int = 1, x2) %*% matrix(c(3, .5, .7)) + sigma, sd = 3)
##D     data.frame(
##D       y = Data$y,
##D       y2 = y2[Data$ID2],
##D       x1 = x2[Data$ID2, 1],
##D       x2 = x2[Data$ID2, 2],
##D       ID = Data$ID2)
##D   })
##D   m <- varian(y2 ~ x1 + x2, y ~ 1 | ID, data = sim.data, design = "V -> Y",
##D     totaliter = 10000, warmup = 1500, thin = 10, chains = 4, verbose=TRUE)
##D 
##D   # check diagnostics
##D   vm_diagnostics(m)
##D 
##D   sim.data2 <- with(simulate_gvm(21, 250, 0, 1, 3, 2, 94367), {
##D     set.seed(265393)
##D     x2 <- MASS::mvrnorm(k, c(0, 0), matrix(c(1, .3, .3, 1), 2))
##D     y2 <- rnorm(k, cbind(Int = 1, x2) %*% matrix(c(3, .5, .7)) + sigma, sd = 3)
##D     data.frame(
##D       y = Data$y,
##D       y2 = y2[Data$ID2],
##D       x1 = x2[Data$ID2, 1],
##D       x2 = x2[Data$ID2, 2],
##D       ID = Data$ID2)
##D   })
##D   # warning: may take several minutes
##D   m2 <- varian(y2 ~ x1 + x2, y ~ 1 | ID, data = sim.data2, design = "V -> Y",
##D     totaliter = 10000, warmup = 1500, thin = 10, chains = 4, verbose=TRUE)
##D   # check diagnostics
##D   vm_diagnostics(m2)
## End(Not run)



