library(frontier)


### Name: coef.summary.frontier
### Title: coef method for class summary.frontier
### Aliases: coef.summary.frontier
### Keywords: models

### ** Examples

   # example included in FRONTIER 4.1
   data( front41Data )

   sfaResult <- sfa( log( output ) ~ log( capital ) + log( labour ),
      data = front41Data )
   coef( summary( sfaResult ), which = "ols" )
   coef( summary( sfaResult ) )
   coef( summary( sfaResult, extraPar = TRUE ) )



