library(frontier)


### Name: fitted.frontier
### Title: Returning Fitted (Frontier) Values
### Aliases: fitted.frontier
### Keywords: methods

### ** Examples

   # rice producers in the Philippines (panel data)
   data( "riceProdPhil" )
   library( "plm" )
   riceProdPhil <- pdata.frame( riceProdPhil, c( "FMERCODE", "YEARDUM" ) )

   # Error Components Frontier (Battese & Coelli 1992), no time effect
   rice <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = riceProdPhil )
   fitted( rice )
   riceProdPhil$fitted <- fitted( rice, asInData = TRUE )

   # Error Components Frontier (Battese & Coelli 1992), with time effect
   riceTime <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = riceProdPhil, timeEffect = TRUE )
   fitted( riceTime )
   riceProdPhil$fittedTime <- fitted( riceTime, asInData = TRUE )



