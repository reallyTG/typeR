library(CARBayesST)


### Name: ST.CARanova
### Title: Fit a spatio-temporal generalised linear mixed model to data,
###   with spatial and temporal main effects and a spatio-temporal
###   interaction.
### Aliases: ST.CARanova

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


#### set up spatial (W) and temporal (D) neighbourhood matrices
distance <- as.matrix(dist(Grid))
W <-array(0, c(K,K))
W[distance==1] <-1 	
	
D <-array(0, c(N,N))
for(i in 1:N)
{
    for(j in 1:N)
    {
        if(abs((i-j))==1)  D[i,j] <- 1 
    }	
}


#### Simulate the elements in the linear predictor and the data
gamma <- rnorm(n=N.all, mean=0, sd=0.001)
x <- rnorm(n=N.all, mean=0, sd=1)
beta <- 0.1

Q.W <- 0.99 * (diag(apply(W, 2, sum)) - W) + 0.01 * diag(rep(1,K))
Q.W.inv <- solve(Q.W)
phi <- mvrnorm(n=1, mu=rep(0,K), Sigma=(0.01 * Q.W.inv))

Q.D <- 0.99 * (diag(apply(D, 2, sum)) - D) + 0.01 * diag(rep(1,N))
Q.D.inv <- solve(Q.D)
delta <- mvrnorm(n=1, mu=rep(0,N), Sigma=(0.01 * Q.D.inv))

phi.long <- rep(phi, N)
delta.long <- kronecker(delta, rep(1,K))
LP <- 4 +  x * beta + phi.long +  delta.long + gamma
mean <- exp(LP)
Y <- rpois(n=N.all, lambda=mean)


#### Run the model
## Not run: 
##D model <- ST.CARanova(formula=Y~x, family="poisson", interaction=TRUE, 
##D W=W, burnin=10000, n.sample=50000)
## End(Not run)


#### Toy example for checking
model <- ST.CARanova(formula=Y~x, family="poisson", interaction=TRUE, 
W=W, burnin=10, n.sample=50)



