library(CARBayesST)


### Name: ST.CARsepspatial
### Title: Fit a spatio-temporal generalised linear mixed model to data,
###   with a common temporal main effect and separate spatial surfaces with
###   individual variances.
### Aliases: ST.CARsepspatial

### ** Examples

#################################################
#### Run the model on simulated data on a lattice
#################################################
#### set up the regular lattice    
x.easting <- 1:10
x.northing <- 1:10
Grid <- expand.grid(x.easting, x.northing)
K <- nrow(Grid)
N <- 5
N.all <- N * K
  
        
#### set up spatial neighbourhood matrix W
distance <- as.matrix(dist(Grid))
W <-array(0, c(K,K))
W[distance==1] <-1 	


#### Create the spatial covariance matrix
Q.W <- 0.99 * (diag(apply(W, 2, sum)) - W) + 0.01 * diag(rep(1,K))
Q.W.inv <- solve(Q.W)
  
           
#### Simulate the elements in the linear predictor and the data
x <- rnorm(n=N.all, mean=0, sd=1)
beta <- 0.1

phi1 <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.01 * Q.W.inv))
phi2 <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.01 * Q.W.inv))
phi3 <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.01 * Q.W.inv))
phi4 <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.05 * Q.W.inv))
phi5 <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.05 * Q.W.inv))
  
delta <- c(0, 0.5, 0, 0.5, 0)
phi.long <- c(phi1, phi2, phi3, phi4, phi5)
delta.long <- kronecker(delta, rep(1,K))
LP <- 4 +  x * beta + phi.long +  delta.long
mean <- exp(LP)
Y <- rpois(n=N.all, lambda=mean)
  
                
#### Run the model
## Not run: 
##D model <- ST.CARsepspatial(formula=Y~x, family="poisson", W=W, burnin=10000, 
##D n.sample=50000)
## End(Not run)


#### Toy example for checking
model <- ST.CARsepspatial(formula=Y~x, family="poisson", W=W, burnin=10, 
n.sample=50)



