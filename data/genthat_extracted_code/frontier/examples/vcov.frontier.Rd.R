library(frontier)


### Name: vcov.frontier
### Title: vcov method for class frontier
### Aliases: vcov.frontier
### Keywords: models

### ** Examples

   # example included in FRONTIER 4.1
   data( front41Data )

   sfaResult <- sfa( log( output ) ~ log( capital ) + log( labour ),
      data = front41Data )
   vcov( sfaResult )



