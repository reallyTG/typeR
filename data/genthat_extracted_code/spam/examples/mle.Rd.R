library(spam)


### Name: mle
### Title: Maximum likelihood estimates
### Aliases: neg2loglikelihood.spam mle.spam mle.nomean.spam
###   neg2loglikelihood mle mle.nomean
### Keywords: algebra

### ** Examples

# True parameter values:
truebeta <- c(1,2,.2)    # beta = (intercept, linear in x, linear in y)
truetheta <- c(.5,2,.02) # theta = (range, sill, nugget)



# We now define a grid, distance matrix, and a sample:
x <- seq(0,1,l=5)
locs <- expand.grid( x, x)
X <- as.matrix( cbind(1,locs))  # design matrix

distmat <- nearest.dist( locs, upper=NULL) # distance matrix
Sigma <- cov.sph( distmat, truetheta)    # true covariance matrix


set.seed(15)
y <- c(rmvnorm.spam(1,X %*% truebeta,Sigma)) # construct sample

# Here is the negative 2 log likelihood:
neg2loglikelihood.spam( y, X, distmat, cov.sph,
                       truebeta, truetheta)

# We pass now to the mle:
res <- mle.spam(y, X, distmat, cov.sph,
         truebeta, truetheta,thetalower=c(0,0,0),thetaupper=c(1,Inf,Inf))

# Similar parameter estimates here, of course:
mle.nomean.spam(y-X%*%res$par[1:3], distmat, cov.sph,
         truetheta, thetalower=c(0,0,0), thetaupper=c(1,Inf,Inf))



