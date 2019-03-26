library(CARBayes)


### Name: S.glm
### Title: Fit a generalised linear model to data.
### Aliases: S.glm

### ** Examples

#################################################
#### Run the model on simulated data on a lattice
#################################################
#### Set up a square lattice region
x.easting <- 1:10
x.northing <- 1:10
Grid <- expand.grid(x.easting, x.northing)
K <- nrow(Grid)

#### Generate the covariates and response data
x1 <- rnorm(K)
x2 <- rnorm(K)
logit <- x1 + x2
prob <- exp(logit) / (1 + exp(logit))
trials <- rep(50,K)
Y <- rbinom(n=K, size=trials, prob=prob)

#### Run the model
formula <- Y ~ x1 + x2
## Not run: 
##D model <- S.glm(formula=formula, family="binomial", trials=trials, 
##D burnin=20000, n.sample=100000)
## End(Not run)

#### Toy example for checking
model <- S.glm(formula=formula, family="binomial", trials=trials, 
burnin=10, n.sample=50)



