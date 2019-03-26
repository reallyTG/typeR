library(mvnfast)


### Name: dmixn
### Title: Fast density computation for mixture of multivariate normal
###   distributions.
### Aliases: dmixn

### ** Examples

#### 1) Example use
# Set up mixture density
mu <- matrix(rep(c(1, 2, 10, 20), 2), 2, 2, byrow = TRUE)
sigma <- list(diag(c(1, 10)), matrix(c(1, -0.9, -0.9, 1), 2, 2))
w <- c(0.1, 0.9)

# Simulate
X <- rmixn(1e4, mu, sigma, w)

# Evaluate density
ds <- dmixn(X, mu, sigma, w = w)
head(ds)

##### 2) More complicated example
# Define mixture
set.seed(5135)
N <- 10000
d <- 2
w <- rep(1, 2) / 2
mu <- matrix(rep(c(0, 0, 2, 3), 2), 2, 2, byrow = TRUE) 
sigma <- list(matrix(c(1, 0, 0, 2), 2, 2), matrix(c(1, -0.9, -0.9, 1), 2, 2)) 

# Simulate random variables
X <- rmixn(N, mu, sigma, w = w, retInd = TRUE)

# Plot mixture density
np <- 100
xvals <- seq(min(X[ , 1]), max(X[ , 1]), length.out = np)
yvals <- seq(min(X[ , 2]), max(X[ , 2]), length.out = np)
theGrid <- expand.grid(xvals, yvals) 
theGrid <- as.matrix(theGrid)
dens <- dmixn(theGrid, mu, sigma, w = w)
plot(X, pch = '.', col = attr(X, "index")+1)
contour(x = xvals, y = yvals, z = matrix(dens, np, np),
        levels = c(0.002, 0.01, 0.02, 0.04, 0.08, 0.15 ), add = TRUE, lwd = 2)




