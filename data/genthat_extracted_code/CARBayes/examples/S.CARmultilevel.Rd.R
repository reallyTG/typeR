library(CARBayes)


### Name: S.CARmultilevel
### Title: Fit a spatial generalised linear mixed model to multi-level
###   areal unit data, where the spatial random effects have a Leroux
###   conditional autoregressive prior and there are also individual or
###   small group level random effects.
### Aliases: S.CARmultilevel

### ** Examples

#################################################
#### Run the model on simulated data on a lattice
#################################################
    
#### Set up a square lattice region
x.easting <- 1:10
x.northing <- 1:10
Grid <- expand.grid(x.easting, x.northing)
K <- nrow(Grid)
    
#### set up distance and neighbourhood (W, based on sharing a common border) matrices
distance <- as.matrix(dist(Grid))
W <-array(0, c(K,K))
W[distance==1] <-1 	

#### Generate the number of individuals per area and which individuals to which areas
n <- sample(5:30, K, replace=TRUE)
n.total <- sum(n)
ind.area.temp <- rep(1:K, n)
ind.area <- sample(ind.area.temp, n.total, replace=FALSE)

#### Generate a categorical variable
n.levels <- n.total / (0.5*1+0.36*2+0.14*3)
m2 <- round(n.levels * 0.36)
m3 <- round(n.levels * 0.14)
levels.temp <- c(kronecker(1:m3, rep(1,3)), kronecker((m3+1):(m3+m2), rep(1,2)))
m1 <- n.total-length(levels.temp)
levels.temp2 <- c(levels.temp, (max(levels.temp)+1):(max(levels.temp)+m1))
ind.re <-sample(levels.temp2)
q <- m1+m2+m3

#### Generate the covariates and response data
x1 <- rnorm(n.total)
x2 <- rnorm(n.total)
phi <- mvrnorm(n=1, mu=rep(0,K), Sigma=0.4 * exp(-0.1 * distance))
phi.extend <- phi[ind.area]
zeta <- rnorm(n=q, mean=0, sd=0.1)
zeta.extend <- zeta[ind.re] 
logit <- x1 + x2 + phi.extend + zeta.extend
prob <- exp(logit) / (1 + exp(logit))
trials <- rep(50,n.total)
Y <- rbinom(n=n.total, size=trials, prob=prob)
    
    
#### Run the model
formula <- Y ~ x1 + x2
## Not run: 
##D model <- S.CARmultilevel(formula=formula, family="binomial", ind.area=ind.area,
##D                 ind.re=as.factor(ind.re), trials=trials, W=W, burnin=20000, n.sample=100000)
## End(Not run)
                
#### Toy example for checking
model <- S.CARmultilevel(formula=formula, family="binomial", ind.area=ind.area,
                ind.re=as.factor(ind.re), trials=trials, W=W, burnin=10, n.sample=50)



