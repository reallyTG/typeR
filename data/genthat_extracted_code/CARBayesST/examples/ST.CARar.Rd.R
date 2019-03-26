library(CARBayesST)


### Name: ST.CARar
### Title: Fit a spatio-temporal generalised linear mixed model to data,
###   with a spatio-temporal autoregressive process.
### Aliases: ST.CARar

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
N.all <- N * K

    
#### set up spatial neighbourhood matrix W
distance <- as.matrix(dist(Grid))
W <-array(0, c(K,K))
W[distance==1] <-1 	


#### Simulate the elements in the linear predictor and the data
gamma <- rnorm(n=N.all, mean=0, sd=0.001)
x <- rnorm(n=N.all, mean=0, sd=1)
beta <- 0.1
    
Q.W <- 0.99 * (diag(apply(W, 2, sum)) - W) + 0.01 * diag(rep(1,K))
Q.W.inv <- solve(Q.W)
phi.temp <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.1 * Q.W.inv))
phi <- phi.temp
    for(i in 2:N)
    {
    phi.temp2 <- mvrnorm(n=1, mu=(0.8 * phi.temp), Sigma=(0.1 * Q.W.inv))
    phi.temp <- phi.temp2
    phi <- c(phi, phi.temp)
    }
    
LP <- 3 + x * beta  + phi
mean <- exp(LP)
Y <- rpois(n=N.all, lambda=mean)
    

#### Run the model
## Not run: 
##D model <- ST.CARar(formula=Y~x, family="poisson",  W=W, burnin=10000,
##D     n.sample=50000)
## End(Not run)
    
    
#### Toy example for checking  
model <- ST.CARar(formula=Y~x, family="poisson",  W=W, burnin=10,
    n.sample=50)



