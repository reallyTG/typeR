library(frontier)


### Name: residuals.frontier
### Title: Returning Residuals
### Aliases: residuals.frontier
### Keywords: methods

### ** Examples

   # rice producers in the Philippines (panel data)
   data( "riceProdPhil" )
   library( "plm" )
   riceProdPhil <- pdata.frame( riceProdPhil, c( "FMERCODE", "YEARDUM" ) )

   # Error Components Frontier (Battese & Coelli 1992), no time effect
   rice <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = riceProdPhil )
   residuals( rice )
   riceProdPhil$residuals <- residuals( rice, asInData = TRUE )

   # Error Components Frontier (Battese & Coelli 1992), with time effect
   riceTime <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = riceProdPhil, timeEffect = TRUE )
   residuals( riceTime )
   riceProdPhil$residualsTime <- residuals( riceTime, asInData = TRUE )



