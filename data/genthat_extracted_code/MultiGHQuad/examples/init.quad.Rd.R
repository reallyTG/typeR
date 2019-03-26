library(MultiGHQuad)


### Name: init.quad
### Title: Q-dimensional grid of quadrature points.
### Aliases: init.quad

### ** Examples

### basic quadrature grid /w pruning.
mu <- c(0,0)
sigma <- matrix(c(1,.5,.5,1),2,2)
grid <- init.quad(Q = 2, prior = list(mu = mu, Sigma = sigma), ip = 10, prune = FALSE)
grid2 <- init.quad(Q = 2, prior = list(mu = mu, Sigma = sigma), ip = 10, prune = TRUE)
library(mvtnorm)
normal <- rmvnorm(1000, mu, sigma)
# noise
plot(normal, xlim = c(-6,6), ylim = c(-6,6), pch = 19, col = rgb(0,0,0,.5))
# full quad grid
points(grid$X, cex = exp(grid$W)/max(exp(grid$W))*4, col = 'red', pch = 20)
# pruned quad grid
points(grid2$X, cex = exp(grid2$W)/max(exp(grid2$W))*4, col = 'green', pch = 20)


### Adaptive quadrature grid
prior <- list(mu = c(0,0), Sigma = matrix(c(1,.5,.5,1),2,2))
adapt <- list(mu = c(-2,2), Sigma = prior$Sigma / 2)
grid <- init.quad(Q = 2, prior, ip = 10, prune = FALSE)
library(mvtnorm)
normal <- rmvnorm(1000, adapt$mu, adapt$Sigma)
# noise, centered at (-2, 2)
plot(normal, xlim = c(-6,6), ylim = c(-6,6), pch = 19, col = rgb(0,0,0,.5))
# initial quad grid, centered at (0, 0)
points(grid$X, cex = exp(grid$W)/max(exp(grid$W))*4, col = 'red', pch = 20)
# adapted grid
grid2 <- init.quad(Q =2, prior, adapt = adapt, ip = 10, prune = TRUE)
points(grid2$X, cex = exp(grid2$W)/max(exp(grid2$W))*4, col = 'green', pch = 20)
# the grid is adapted to the latest estimate, but weighted towards the prior 



