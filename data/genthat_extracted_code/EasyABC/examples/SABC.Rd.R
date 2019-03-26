library(EasyABC)


### Name: SABC
### Title: Simulated Annealing approach to Approximate Bayesian Computation
###   (SABC)
### Aliases: SABC SABC.noninf SABC.inf

### ** Examples

 ## Not run: 
##D  
##D ## Example for "noninformative" case
##D # Prior is uniform on [-10,10]
##D d.prior <- function(par)
##D     dunif(par,-10,10)
##D r.prior <- function()
##D     runif(1,-10,10)
##D 
##D # Model is the sum of two normal distributions. Return distance to observation 0:
##D f.dist <- function(par)
##D     return( abs(rnorm( 1 , par , ifelse(runif(1)<0.5,1,0.1 ) )))
##D 
##D # Run algorithm ("noninformative" case)
##D res <- SABC(f.dist,r.prior,d.prior,n.sample=500,eps.init=2,iter.max=50000)
##D  
## End(Not run)

 ## Not run: ##D 
##D # Histogram of results
##D hist(res$E[,1],breaks=200)
##D  
## End(Not run)



