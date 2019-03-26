library(CARBayesST)


### Name: ST.CARclustrends
### Title: Fit a spatio-temporal generalised linear mixed model to data,
###   with a clustering of temporal trend functions and a temporally common
###   spatial surface.
### Aliases: ST.CARclustrends

### ** Examples

##################################################
#### Run the model on simulated data on a lattice
##################################################
#### Load the libraries required
library(truncdist)
library(gtools)


#### set up the regular lattice    
x.easting <- 1:10
x.northing <- 1:10
Grid <- expand.grid(x.easting, x.northing)
K <- nrow(Grid)
N <- 10
N.all <- N * K

#### set up spatial neighbourhood matrix W
distance <- as.matrix(dist(Grid))
W <-array(0, c(K,K))
W[distance==1] <-1 	


#### Create the spatial covariance matrix
Q.W <- 0.99 * (diag(apply(W, 2, sum)) - W) + 0.01 * diag(rep(1,K))
Q.W.inv <- solve(Q.W)
  
           
#### Simulate the elements in the linear predictor and the data
beta <- 0.01
gamma <- 0.7
phi <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.01 * Q.W.inv))

lambda <- rep(1/2, 2)
w <- t(rmultinom(K, 1, lambda))

Y <- matrix(NA, nrow = K, ncol = N)
for (i in 1:N)
{
  LP <- beta + w[, 2] * (gamma * i) + phi
  mean <- exp(LP)
  Y[, i] <- rpois(n=K, lambda=mean)
 }
Y <- as.numeric(Y)


#### Run the model
## Not run: 
##D model <- ST.CARclustrends(formula=Y~1, family="poisson", W=W, burnin=10000, 
##D n.sample=50000, trends=c("Constant", "LI"))
## End(Not run)


#### Toy example for checking
model <- ST.CARclustrends(formula=Y~1, family="poisson", W=W, burnin=10, 
n.sample=50, trends=c("Constant", "LI"))



