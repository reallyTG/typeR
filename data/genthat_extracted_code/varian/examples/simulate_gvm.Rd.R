library(varian)


### Name: simulate_gvm
### Title: Simulate a Gamma Variability Model
### Aliases: simulate_gvm
### Keywords: utilities

### ** Examples

raw.sim <- simulate_gvm(12, 140, 0, 1, 4, .1, 94367)
sim.data <- with(raw.sim, {
  set.seed(265393)
  x2 <- MASS::mvrnorm(k, c(0, 0), matrix(c(1, .3, .3, 1), 2))
  y2 <- rnorm(k, cbind(Int = 1, x2) %*% matrix(c(3, .5, .7)) + sigma, sd = 3)
  data.frame(
    y = Data$y,
    y2 = y2[Data$ID2],
    x1 = x2[Data$ID2, 1],
    x2 = x2[Data$ID2, 2],
    ID = Data$ID2)
})



