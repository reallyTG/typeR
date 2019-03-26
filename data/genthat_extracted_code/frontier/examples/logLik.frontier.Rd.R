library(frontier)


### Name: logLik.frontier
### Title: Extract Log-Likelihood Value
### Aliases: logLik.frontier
### Keywords: models

### ** Examples

   # example included in FRONTIER 4.1
   data( front41Data )

   # SFA estimation with starting values obtained from a grid search
   sfaResult <- sfa( log( output ) ~ log( capital ) + log( labour ),
      data = front41Data )
   logLik( sfaResult, which = "ols" )
   logLik( sfaResult, which = "grid" )
   logLik( sfaResult )

   # SFA estimation with starting values provided by the user
   sfaResult2 <- sfa( log( output ) ~ log( capital ) + log( labour ),
      data = front41Data, startVal = 0.9 * coef( sfaResult ) )
   logLik( sfaResult2, which = "ols" )
   logLik( sfaResult2, which = "start" )
   logLik( sfaResult2 )

   # evaluate log likelihood function for a user-provided parameter vector
   logLik( sfaResult, newParam = 0.9 * coef( sfaResult ) )
      # equal to  logLik( sfaResult2, which = "start" )

   # log likelihood function for different values of gamma
   plot( t( sapply( seq( 0.05, 0.95, 0.05 ), function(x) c( x,
      logLik( sfaResult, newParam = c( coef( sfaResult )[1:4], x ) ) ) ) ) )



