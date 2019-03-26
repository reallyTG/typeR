library(smallarea)


### Name: estimate.unknownsampvar
### Title: Estimates of variance component, unknown sampling variance,
###   regression coefficients and small area means in Fay Herriot model
###   with unknown sampling variance.
### Aliases: estimate.unknownsampvar
### Keywords: fay Herriot small area estimation variance component unknown
###   sampling variance

### ** Examples

set.seed( 55 )                  # setting a random seed
require(MASS)                   # the function mvrnorm requires MASS
x1 <- rep( 1, 10 )              # vector of ones representing intercept
x2 <- rnorm( 10 )               # vector of covariates randomly generated
x <- cbind( x1, x2 )            # design matrix
x <- as.matrix( x )             # coercing into class matrix
n <- rbinom (10, 20, 0.4)       # generating sample sizes for each small area
psi <- 1                        # true value of the psi parameter
delta <- 1                      # true value of the delta parameter
beta <- c( 1, 0.5 )             # true values of the regression parameters
theta <- mvrnorm( 1, as.vector( x %*% beta ), diag(10) )  # true small area means
y <- mvrnorm( 1, as.vector( theta ), diag( delta/n ) )  # design based estimators
estimate.unknownsampvar( y, x, n )      




