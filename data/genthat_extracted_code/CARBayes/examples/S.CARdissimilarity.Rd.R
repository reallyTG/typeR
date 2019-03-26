library(CARBayes)


### Name: S.CARdissimilarity
### Title: Fit a spatial generalised linear mixed model to data, where the
###   random effects have a localised conditional autoregressive prior.
### Aliases: S.CARdissimilarity

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

#### Split the area into two groups between which there will be a boundary.
groups <-rep(1, K) 
groups[Grid$Var1>5] <- 2

#### set up distance and neighbourhood (W, based on sharing a common border) matrices
distance <- as.matrix(dist(Grid))
W <-array(0, c(K,K))
W[distance==1] <-1 	
	
#### Generate the response data
phi <- mvrnorm(n=1, mu=groups, Sigma=0.2 * exp(-0.1 * distance))
logit <- phi
prob <- exp(logit) / (1 + exp(logit))
trials <- rep(50,K)
Y <- rbinom(n=K, size=trials, prob=prob)


#### Generate a dissimilarity metric
dissimilarity <- cbind(groups) + rnorm(K, sd=0.2)
dissimilarity.matrix <- as.matrix(dist(cbind(dissimilarity, dissimilarity), 
method="manhattan", diag=TRUE, upper=TRUE)) * W/2

Z <- list(dissimilarity.matrix=dissimilarity.matrix)

#### Run the localised smoothing model
formula <- Y ~ 1
## Not run: 
##D model <- S.CARdissimilarity(formula=formula, family="binomial",
##D trials=trials, W=W, Z=Z, W.binary=TRUE, burnin=20000, n.sample=100000)
## End(Not run)

#### Toy example for checking
model <- S.CARdissimilarity(formula=formula, family="binomial",
trials=trials, W=W, Z=Z, W.binary=TRUE, burnin=10, n.sample=50)



