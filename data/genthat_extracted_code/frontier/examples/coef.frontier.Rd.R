library(frontier)


### Name: coef.frontier
### Title: coef method for class frontier
### Aliases: coef.frontier
### Keywords: models

### ** Examples

   # example included in FRONTIER 4.1
   data( front41Data )

   sfaResult <- sfa( log( output ) ~ log( capital ) + log( labour ),
      data = front41Data )
   coef( sfaResult, which = "ols" )
   coef( sfaResult, which = "grid" )
   coef( sfaResult )



