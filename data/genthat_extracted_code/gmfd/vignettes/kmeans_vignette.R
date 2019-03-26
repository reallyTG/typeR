## ---- fig.show='hold'----------------------------------------------------
library( gmfd )

# Define the parameters
n <- 50
P <- 100
K <- 150

# Grid of the functional dataset
t <- seq( 0, 1, length.out = P )

# Define the means and the parameters to use in the simulation
m1 <- t^2 * ( 1 - t )

rho <- rep( 0, K )
theta <- matrix( 0, K, P )
for ( k in 1:K ) {
  rho[k] <- 1 / ( k + 1 )^2
  if ( k%%2 == 0 )
    theta[k, ] <- sqrt( 2 ) * sin( k * pi * t )
  else if ( k%%2 != 0 && k != 1 )
    theta[k, ] <- sqrt( 2 ) * cos( ( k - 1 ) * pi * t )
  else
    theta[k, ] <- rep( 1, P )
}

# Simulate the functional data
X <- gmfd_simulate( size = n, mean = m1, rho = rho, theta = theta )


## ---- fig.show='hold', fig.align ='center'-------------------------------

# Create a functional data object
FD1 <- funData( t, X )

# Plot the funData object
plot( FD1, col = "blue" , xlab = "grid", ylab = "data")


## ---- fig.show = 'hold'--------------------------------------------------
# We estimate the eigenvalues and eigenfunctions of the covariance matrix of data
lambda <- eigen( cov( FD1$data[[1]] ) )$values
phi <- eigen( cov( FD1$data[[1]] ) )$vectors

# Extract two curves from the samples to compute the distance between them
x <- funData( t, FD1$data[[1]][1, ] )
y <- funData( t, FD1$data[[1]][2, ] )

distance <- funDist( x, y, metric = "mahalanobis", p = 10^5, lambda, phi )
distance

## ---- fig.show = 'hold'--------------------------------------------------

# Simulate another functional sample
s <- 0
for ( k in 4:K ) {
  s <- s + sqrt( rho[k] ) * theta[k, ]
}

m2 <- m1 + s
Y <- gmfd_simulate( n, m2, rho = rho, theta = theta )
FD2 <- funData( t, Y )

test_output <- gmfd_test(FD1, FD2, conf.level = 0.95, stat_test = "mahalanobis", p = 10^5)
test_output

## ---- fig.show='hold', fig.width=6,  fig.align ='center'-----------------

# We estimate the eigenvalues and eigenfunctions of the covariance matrix of all merged data
lambda <- eigen( cov( rbind( FD1$data[[1]], FD2$data[[1]] ) ) )$values
phi <- eigen( cov ( rbind( FD1$data[[1]], FD2$data[[1]] ) ) )$vectors

# Functional data sample containing the merged samples
FD <- funData( t, rbind( X, Y ) )

kmeans_output <- gmfd_kmeans( FD, n.cl = 2, metric = "mahalanobis", p = 10^5 )


