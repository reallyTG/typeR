library(joineRML)


### Name: simData
### Title: Simulate data from a joint model
### Aliases: simData
### Keywords: datagen multivariate survival

### ** Examples

beta <- rbind(c(0.5, 2, 1, 1),
c(2, 2, -0.5, -1))
D <- diag(4)
D[1, 1] <- D[3, 3] <- 0.5
D[1, 2] <- D[2, 1] <- D[3, 4] <- D[4, 3] <- 0.1
D[1, 3] <- D[3, 1] <- 0.01

sim <- simData(n = 250, beta = beta, D = D, sigma2 = c(0.25, 0.25),
               censlam = exp(-0.2), gamma.y = c(-.2, 1), ntms = 8)



