library(micEconAids)


### Name: aidsEst
### Title: Estimating the Almost Ideal Demand System (AIDS)
### Aliases: aidsEst print.aidsEst
### Keywords: models

### ** Examples

   # Using data published in Blanciforti, Green & King (1986)
   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   ## Repeating the demand analysis of Blanciforti, Green & King (1986)
   ## Note: Blanciforti, Green & King (1986) use scaled data,
   ##       which leads to slightly different results
   estResult <- aidsEst( c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      c( "wFood1", "wFood2", "wFood3", "wFood4" ), "xFood",
      data = Blanciforti86, priceIndex = "SL", maxiter = 100 )
   print( estResult )
   elas( estResult )

   ## Estimations with a demand shifter: linear trend
   priceNames <- c( "pFood1", "pFood2", "pFood3", "pFood4" )
   shareNames <- c( "wFood1", "wFood2", "wFood3", "wFood4" )
   Blanciforti86$trend <- c( 0:( nrow( Blanciforti86 ) - 1 ) )
   estResult <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, shifterNames = "trend" )
   print( estResult )

   # Estimations with two demand shifters: linear + quadratic trend
   Blanciforti86$trend2 <- c( 0:( nrow( Blanciforti86 ) - 1 ) )^2
   estResult <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, shifterNames = c( "trend", "trend2" ) )
   print( estResult )



