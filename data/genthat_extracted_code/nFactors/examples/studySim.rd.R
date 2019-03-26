library(nFactors)


### Name: studySim
### Title: Simulation Study from Given Factor Structure Matrices and
###   Conditions
### Aliases: studySim
### Keywords: multivariate

### ** Examples

## Not run: 
##D # ....................................................................
##D # Example inspired from Zwick and Velicer (1986)
##D # Very long computimg time
##D # ...................................................................
##D 
##D # 1. Initialisation
##D # reppar    <- 30
##D # repsim    <- 5
##D # quantile  <- 0.50
##D 
##D # 2. Simulations
##D # X         <- studySim(var=36,nFactors=3, pmjc=c(6,12), loadings=c(0.5,0.8),
##D #                       unique=c(0,0.2), quantile=quantile,
##D #                       N=c(72,180), repsim=repsim, reppar=reppar,
##D #                       stats=c(1:6))
##D 
##D # 3. Results (first 10 results)
##D # print(X[1:10,1:14],2)
##D # names(X)
##D 
##D # 4. Study of the error done in the determination of the number
##D #    of components/factors. A positive value is associated to over
##D #    determination.
##D # results   <- X[X$stats=="mean",]
##D # residuals <- results[,c(11:25)] - X$nfactors
##D # BY        <- c("nsubjects","var","loadings")
##D # round(aggregate(residuals, by=results[BY], mean),0)
##D  
## End(Not run)
 


