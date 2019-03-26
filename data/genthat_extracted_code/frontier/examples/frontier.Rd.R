library(frontier)


### Name: sfa
### Title: Stochastic Frontier Analysis
### Aliases: sfa frontier print.frontier
### Keywords: models

### ** Examples

   # example included in FRONTIER 4.1 (cross-section data)
   data( front41Data )

   # Cobb-Douglas production frontier
   cobbDouglas <- sfa( log( output ) ~ log( capital ) + log( labour ),
      data = front41Data )
   summary( cobbDouglas )

   # load data about rice producers in the Philippines (panel data)
   data( riceProdPhil )

   # Error Components Frontier (Battese & Coelli 1992)
   # with observation-specific efficiencies (ignoring the panel structure)
   rice <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = riceProdPhil )
   summary( rice )

   # Error Components Frontier (Battese & Coelli 1992)
   # with "true" fixed individual effects and observation-specific efficiencies
   riceTrue <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ) + 
      factor( FMERCODE ),  data = riceProdPhil )
   summary( riceTrue )

   # add data set with information about its panel structure
   library( "plm" )
   ricePanel <- pdata.frame( riceProdPhil, c( "FMERCODE", "YEARDUM" ) )

   # Error Components Frontier (Battese & Coelli 1992)
   # with time-invariant efficiencies
   riceTimeInv <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = ricePanel )
   summary( riceTimeInv )

   # Error Components Frontier (Battese & Coelli 1992)
   # with time-variant efficiencies
   riceTimeVar <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ),
      data = ricePanel, timeEffect = TRUE )
   summary( riceTimeVar )

   # Technical Efficiency Effects Frontier (Battese & Coelli 1995)
   # (efficiency effects model with intercept)
   riceZ <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ) |
      EDYRS + BANRAT, data = riceProdPhil )
   summary( riceZ )

   # Technical Efficiency Effects Frontier (Battese & Coelli 1995)
   # (efficiency effects model without intercept)
   riceZ2 <- sfa( log( PROD ) ~ log( AREA ) + log( LABOR ) + log( NPK ) |
      EDYRS + BANRAT - 1, data = riceProdPhil )
   summary( riceZ2 )

   # Cost Frontier (with land as quasi-fixed input)
   riceProdPhil$cost <- riceProdPhil$LABOR * riceProdPhil$LABORP +
      riceProdPhil$NPK * riceProdPhil$NPKP
   riceCost <- sfa( log( cost ) ~ log( PROD ) + log( AREA ) + log( LABORP )
      + log( NPKP ), data = riceProdPhil, ineffDecrease = FALSE )
   summary( riceCost )



