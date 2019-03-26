library(CARBayes)


### Name: S.CARleroux
### Title: Fit a spatial generalised linear mixed model to data, where the
###   random effects have a Leroux conditional autoregressive prior.
### Aliases: S.CARleroux

### ** Examples

#################################################
#### Run the model on simulated data on a lattice
#################################################
#### Load other libraries required
library(MASS)

#### Set up a square lattice region
x.easting <- 1:10
x.northing <- 1:10
Grid <- expand.grid(x.easting, x.northing)
K <- nrow(Grid)

#### set up distance and neighbourhood (W, based on sharing a common border) matrices
distance <- as.matrix(dist(Grid))
W <-array(0, c(K,K))
W[distance==1] <-1 	
	
#### Generate the covariates and response data
x1 <- rnorm(K)
x2 <- rnorm(K)
theta <- rnorm(K, sd=0.05)
phi <- mvrnorm(n=1, mu=rep(0,K), Sigma=0.4 * exp(-0.1 * distance))
logit <- x1 + x2 + theta + phi
prob <- exp(logit) / (1 + exp(logit))
trials <- rep(50,K)
Y <- rbinom(n=K, size=trials, prob=prob)


#### Run the Leroux model
formula <- Y ~ x1 + x2
## Not run: 
##D model <- S.CARleroux(formula=formula, family="binomial", 
##D trials=trials, W=W, burnin=20000, n.sample=100000)
## End(Not run)

#### Toy example for checking
model <- S.CARleroux(formula=formula, family="binomial", 
trials=trials, W=W, burnin=10, n.sample=50)



