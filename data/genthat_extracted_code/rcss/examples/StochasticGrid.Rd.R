library(rcss)


### Name: StochasticGrid
### Title: Stochastic grid
### Aliases: StochasticGrid

### ** Examples

## Generate paths
start <- c(1, 36)
path_disturb <- array(0, dim = c(2, 2, 100, 50))
path_disturb[1, 1,,] <- 1
rand1 <- rnorm((50 * 100) / 2)
rand1 <- as.vector(rbind(rand1, -rand1))
path_disturb[2, 2,,] <- exp((0.06 - 0.5 * 0.2^2) * 0.02 + 0.2 * sqrt(0.02) * rand1)
path <- PathDisturb(start, path_disturb)
sgrid <- StochasticGrid(path, 81, 10)



