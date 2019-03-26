library(bootLR)


### Name: BayesianLR.test
### Title: Compute the (positive/negative) likelihood ratio with
###   appropriate, bootstrapped confidence intervals
### Aliases: BayesianLR.test

### ** Examples

## Not run: 
##D blrt <- BayesianLR.test( truePos=100, totalDzPos=100, trueNeg=60, totalDzNeg=100 )
##D blrt
##D summary(blrt)
##D 
##D BayesianLR.test( truePos=98, totalDzPos=100, trueNeg=60, totalDzNeg=100 )
##D BayesianLR.test( truePos=60, totalDzPos=100, trueNeg=100, totalDzNeg=100 )
##D BayesianLR.test( truePos=60, totalDzPos=100, trueNeg=99, totalDzNeg=100 )
##D 
##D # Note the argument names are not necessary if you specify them in the proper order:
##D BayesianLR.test( 60, 100, 50, 50 )
##D 
##D # You can specify R= to increase/decrease the number of bootstrap replications
##D BayesianLR.test( 60, 100, 50, 50, R=10000 )
##D 
##D # You can change the number of digits that are printed
##D print.lrtest( BayesianLR.test( 500, 500, 300, 500 ), digits = 4 )
##D 
##D # Or extract the results yourself
##D model.blrt1 <- BayesianLR.test( 500, 500, 300, 500 )
##D unclass( model.blrt1 )
##D model.blrt1$statistics
##D model.blrt1$posLR.ci
##D 
##D # If the model doesn't converge, you can alter the search parameters
##D BayesianLR.test( 500, 500, 300, 500, parameters=list(shrink=4,tol=.001,nEach=150), maxTries = 50 )
##D 
##D ### Statistician-only options
##D # These change the way the model works.
##D # It is not recommended to alter these, as this will alter the statistical properties of the test
##D # in ways that have not been validated.
##D # Change number of bootstrap replications
##D BayesianLR.test( 500, 500, 300, 500, R = 5*10^4 )
##D # Change number of times to average the confidence interval limits at the end
##D BayesianLR.test( 500, 500, 300, 500, nBSave = 100 )
##D # Change the criteria from median being consistent 0 or 1 to some other quantile
##D BayesianLR.test( 500, 500, 300, 500, consistentQuantile = .53 )
## End(Not run)



