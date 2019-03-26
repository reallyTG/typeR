library(gmfd)


### Name: gmfd_kmeans
### Title: k-means clustering algorithm
### Aliases: gmfd_kmeans
### Keywords: Clustering

### ** Examples

# Define parameters
n <- 50
P <- 100
K <- 150

# Grid of the functional dataset
t <- seq( 0, 1, length.out = P )

# Define the means and the parameters to use in the simulation
m1 <- t^2 * ( 1 - t )

rho <- rep( 0, K )
theta <- matrix( 0, K, P )
for ( k in 1:K) {
  rho[k] <- 1 / ( k + 1 )^2
  if ( k%%2 == 0 )
    theta[k, ] <- sqrt( 2 ) * sin( k * pi * t )
  else if ( k%%2 != 0 && k != 1 )
    theta[k, ] <- sqrt( 2 ) * cos( ( k - 1 ) * pi * t )
  else
    theta[k, ] <- rep( 1, P )
}

s <- 0
for (k in 4:K) {
 s <- s + sqrt( rho[k] ) * theta[k, ]
}

m2 <- m1 + s

# Simulate the functional data
x1 <- gmfd_simulate( n, m1, rho = rho, theta = theta )
x2 <- gmfd_simulate( n, m2, rho = rho, theta = theta )

# Create a single functional dataset containing the simulated datasets:
FD <- funData(t, rbind( x1, x2 ) )

output <- gmfd_kmeans( FD, n.cl = 2, metric = "mahalanobis", p = 10^6 )



