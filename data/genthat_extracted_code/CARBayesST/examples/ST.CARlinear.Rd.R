library(CARBayesST)


### Name: ST.CARlinear
### Title: Fit a spatio-temporal generalised linear mixed model to data,
###   where the spatial units have linear time trends with spatially
###   varying intercepts and slopes.
### Aliases: ST.CARlinear

### ** Examples

#################################################
#### Run the model on simulated data on a lattice
#################################################
#### set up the regular lattice    
x.easting <- 1:10
x.northing <- 1:10
Grid <- expand.grid(x.easting, x.northing)
K <- nrow(Grid)
N <- 10
N.all <- K * N


#### set up spatial neighbourhood matrix W
distance <- as.matrix(dist(Grid))
W <-array(0, c(K,K))
W[distance==1] <-1 	


#### Simulate the elements in the linear predictor and the data
x <- rnorm(n=N.all, mean=0, sd=1)
beta <- 0.1
Q.W <- 0.99 * (diag(apply(W, 2, sum)) - W) + 0.01 * diag(rep(1,K))
Q.W.inv <- solve(Q.W)
phi <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.1 * Q.W.inv))
delta <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.1 * Q.W.inv))
trend <- array(NA, c(K, N))
time <-(1:N - mean(1:N))/N
    for(i in 1:K)
    {
    trend[i, ] <- phi[i] + delta[i] * time        
    }
trend.vec <- as.numeric(trend)
LP <- 4 + x * beta + trend.vec
mean <- exp(LP)
Y <- rpois(n=N.all, lambda=mean)


#### Run the model
## Not run: 
##D model <- ST.CARlinear(formula=Y~x, family="poisson", W=W, burnin=10000, 
##D n.sample=50000)
## End(Not run)


#### Toy example for checking 
model <- ST.CARlinear(formula=Y~x, family="poisson", W=W, burnin=10, 
n.sample=50)



