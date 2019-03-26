library(frontier)


### Name: summary.frontier
### Title: summary method for class frontier
### Aliases: summary.frontier print.summary.frontier
### Keywords: models

### ** Examples

   # example included in FRONTIER 4.1 (cross-section data)
   data( front41Data )

   sfaResult <- sfa( log( output ) ~ log( capital ) + log( labour ),
      data = front41Data )
   summary( sfaResult )

   # rice producers in the Phillipines (panel data)
   data( "riceProdPhil" )
   library( "plm" )
   riceProdPhil <- pdata.frame( riceProdPhil, c( "FMERCODE", "YEARDUM" ) )

   # Error Components Frontier
   rice <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = riceProdPhil )
   summary( rice )

   # Efficiency Effects Frontier
   rice2 <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ) |
      EDYRS + BANRAT, data = riceProdPhil )
   summary( rice2 )



