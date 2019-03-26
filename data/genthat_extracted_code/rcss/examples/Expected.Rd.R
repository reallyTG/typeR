library(rcss)


### Name: Expected
### Title: Expected value function
### Aliases: Expected

### ** Examples

## Bermuda put option
grid <- as.matrix(cbind(rep(1, 81), c(seq(20, 60, length = 81))))
disturb <- array(0, dim = c(2, 2, 100))
disturb[1, 1,] <- 1
quantile <- qnorm(seq(0, 1, length = (100 + 2))[c(-1, -(100 + 2))])
disturb[2, 2,] <- exp((0.06 -0.5 * 0.2^2) * 0.02 + 0.2 * sqrt(0.02) * quantile)
weight <- rep(1 / 100, 100)
control <- matrix(c(c(1, 2),c(1, 1)), nrow = 2)
reward <- array(data = 0, dim = c(81, 2, 2, 2, 50))
in_money <- grid[, 2] <= 40
reward[in_money, 1, 2, 2,] <- 40
reward[in_money, 2, 2, 2,] <- -1
for (tt in 1:50){
  reward[,,2,2,tt] <- exp(-0.06 * 0.02 * (tt - 1)) * reward[,,2,2,tt] 
}
scrap <- array(data = 0, dim = c(81, 2, 2))
scrap[in_money, 1, 2] <- 40
scrap[in_money, 2, 2] <- -1
scrap[,,2] <- exp(-0.06 * 0.02 * 50) * scrap[,,2]
bellman <- Bellman(grid, reward, scrap, control, disturb, weight)
expected <- Expected(grid, bellman$value[,,2,2], disturb, weight)



