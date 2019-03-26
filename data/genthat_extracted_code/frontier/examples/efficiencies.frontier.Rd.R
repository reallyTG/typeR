library(frontier)


### Name: efficiencies.frontier
### Title: Returning Efficiency Estimates
### Aliases: efficiencies.frontier
### Keywords: methods

### ** Examples

   # rice producers in the Philippines (panel data)
   data( "riceProdPhil" )
   library( "plm" )
   riceProdPhil <- pdata.frame( riceProdPhil, c( "FMERCODE", "YEARDUM" ) )

   # Error Components Frontier (Battese & Coelli 1992), no time effect
   rice <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = riceProdPhil )
   efficiencies( rice )
   riceProdPhil$efficiencies <- efficiencies( rice, asInData = TRUE )

   # Error Components Frontier (Battese & Coelli 1992), with time effect
   riceTime <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = riceProdPhil, timeEffect = TRUE )
   efficiencies( riceTime )
   riceProdPhil$efficienciesTime <- efficiencies( riceTime, asInData = TRUE )
   
   # Technical Efficiency Effects Frontier (Battese & Coelli 1995)
   rice2 <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ) |
      EDYRS + BANRAT - 1, data = riceProdPhil )
   eff <- efficiencies( rice2, margEff = TRUE )
   attr( eff, "margEff" )   # marginal effects



