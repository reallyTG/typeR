library(mclust)


### Name: simE
### Title: Simulate from a Parameterized MVN Mixture Model
### Aliases: simE simV simEII simVII simEEI simVEI simEVI simVVI simEEE
###   simEEV simVEV simVVV simEVE simEVV simVEE simVVE
### Keywords: cluster

### ** Examples

## Not run: 
##D d <- 2
##D G <- 2
##D scale <- 1
##D shape <- c(1, 9)
##D 
##D O1 <- diag(2)
##D O2 <- diag(2)[,c(2,1)]
##D O <- array(cbind(O1,O2), c(2, 2, 2))
##D O
##D 
##D variance <- list(d= d, G = G, scale = scale, shape = shape, orientation = O)
##D mu <- matrix(0, d, G) ## center at the origin
##D simdat <- simEEV( n = 200, 
##D                   parameters = list(pro=c(1,1),mean=mu,variance=variance),
##D                   seed = NULL)
##D 
##D cl <- simdat[,1]
##D 
##D sigma <- array(apply(O, 3, function(x,y) crossprod(x*y), 
##D                  y = sqrt(scale*shape)), c(2,2,2))
##D paramList <- list(mu = mu, sigma = sigma)
##D coordProj( simdat, paramList = paramList, classification = cl)
## End(Not run)



