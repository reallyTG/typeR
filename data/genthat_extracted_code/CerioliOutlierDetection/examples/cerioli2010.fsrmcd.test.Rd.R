library(CerioliOutlierDetection)


### Name: cerioli2010.fsrmcd.test
### Title: Finite-Sample Reweighted MCD Outlier Detection Test of Cerioli
###   (2010)
### Aliases: cerioli2010.fsrmcd.test
### Keywords: robust multivariate htest

### ** Examples


require(mvtnorm, quiet=TRUE)

############################################
# dimension v, number of observations n
v <- 5
n <- 200
simdata <- array( rmvnorm(n*v, mean=rep(0,v), 
    sigma = diag(rep(1,v))), c(n,v) )
#
# detect outliers with nominal sizes 
# c(0.05,0.01,0.001)
#
sa <- 1. - ((1. - c(0.05,0.01,0.001))^(1./n))
results <- cerioli2010.fsrmcd.test( simdata, 
    signif.alpha=sa )
# count number of outliers detected for each 
# significance level
colSums( results$outliers )


#############################################
# add some contamination to illustrate how to 
# detect outliers using the fsrmcd test
# 10/200 = 5% contamination
simdata[ sample(n,10), ] <- array( 
  rmvnorm( 10*v, mean=rep(2,v), sigma = diag(rep(1,v))),
  c(10,v)
)
results <- cerioli2010.fsrmcd.test( simdata, 
  signif.alpha=sa )
colMeans( results$outliers )


## Not run: 
##D #############################################
##D # example of how to ensure the size of the intersection test is correct
##D 
##D   n.sim <- 5000
##D   simdata <- array( 
##D     rmvnorm(n*v*n.sim, mean=rep(0,v), sigma=diag(rep(1,v))),
##D     c(n,v,n.sim)
##D   )
##D   # in practice we'd do this using one of the parallel processing
##D   # methods out there
##D   sa <- 1. - ((1. - 0.01)^(1./n))
##D   results <- apply( simdata, 3, function(dm) {
##D     z <- cerioli2010.fsrmcd.test( dm, 
##D       signif.alpha=sa )
##D     # true if outliers were detected in the data, false otherwise
##D     any(z$outliers[,1,drop=TRUE])
##D   })
##D   # count the percentage of samples where outliers were detected;
##D   # should be close to the significance level value used (0.01) in these
##D   # samples for the intersection test.
##D   mean(results)
##D 
## End(Not run)



