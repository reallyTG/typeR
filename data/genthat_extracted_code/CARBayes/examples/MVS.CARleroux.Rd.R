library(CARBayes)


### Name: MVS.CARleroux
### Title: Fit a multivariate spatial generalised linear mixed model to
###   data, where the random effects are modelled by a multivariate
###   conditional autoregressive model.
### Aliases: MVS.CARleroux

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
K <- nrow(W)

#### Generate the correlation structures
Q.W <- 0.99 * (diag(apply(W, 2, sum)) - W) + 0.01 * diag(rep(1,K))
Q.W.inv <- solve(Q.W)

Sigma <- matrix(c(1,0.5,0, 0.5,1,0.3, 0, 0.3, 1), nrow=3)
Sigma.inv <- solve(Sigma)
J <- nrow(Sigma)
N.all <- K * J

precision.phi <- kronecker(Q.W, Sigma.inv)
var.phi <- solve(precision.phi)

#### Generate the covariate component
x1 <- rnorm(K)
x2 <- rnorm(K)
XB <- cbind(0.1 * x1 - 0.1*x2, -0.1 * x1 + 0.1*x2, 0.1 * x1 - 0.1*x2)

#### Generate the random effects
phi <- mvrnorm(n=1, mu=rep(0,N.all), Sigma=var.phi)


#### Generate the response data
lp <-as.numeric(t(XB)) + phi
prob <- exp(lp) / (1 + exp(lp))
trials.vec <- rep(100,N.all)
Y.vec <- rbinom(n=N.all, size=trials.vec, prob=prob)

#### Turn the data and trials into matrices where each row is an area.
Y <- matrix(Y.vec, nrow=K, ncol=J, byrow=TRUE)
trials <- matrix(trials.vec, nrow=K, ncol=J, byrow=TRUE)

#### Run the Leroux model
formula <- Y ~ x1 + x2
## Not run: 
##D model <- MVS.CARleroux(formula=formula, family="binomial", 
##D trials=trials, W=W, burnin=20000, n.sample=100000)
## End(Not run)

#### Toy example for checking
model <- MVS.CARleroux(formula=formula, family="binomial", 
trials=trials, W=W, burnin=10, n.sample=50)



