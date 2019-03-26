library(mvnfast)


### Name: ms
### Title: Mean-shift mode seeking algorithm
### Aliases: ms

### ** Examples

set.seed(434)

# Simulating multivariate normal data
N <- 1000
mu <- c(1, 2)
sigma <- matrix(c(1, 0.5, 0.5, 1), 2, 2)
X <- rmvn(N, mu = mu, sigma = sigma)

# Plotting the true density function
steps <- 100
range1 <- seq(min(X[ , 1]), max(X[ , 1]), length.out = steps)
range2 <- seq(min(X[ , 2]), max(X[ , 2]), length.out = steps)
grid <- expand.grid(range1, range2)
vals <- dmvn(as.matrix(grid), mu, sigma)

contour(z = matrix(vals, steps, steps),  x = range1, y = range2, xlab = "X1", ylab = "X2")
points(X[ , 1], X[ , 2], pch = '.')
 
# Estimating the mode from "nrep" starting points
nrep <- 10
index <- sample(1:N, nrep)
for(ii in 1:nrep) {
  start <- X[index[ii], ]
  out <- ms(X, init = start, H = 0.1 * sigma, store = TRUE)
  lines(out$traj[ , 1], out$traj[ , 2], col = 2, lwd = 2) 
  points(out$final[1], out$final[2], col = 4, pch = 3, lwd = 3) # Estimated mode (blue)
  points(start[1], start[2], col = 2, pch = 3, lwd = 3)         # ii-th starting value 
}



