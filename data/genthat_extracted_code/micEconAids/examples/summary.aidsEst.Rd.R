library(micEconAids)


### Name: summary.aidsEst
### Title: Summarizing the Estimation of an Almost Ideal Demand System
### Aliases: summary.aidsEst print.summary.aidsEst
### Keywords: models

### ** Examples

   # Using data published in Blanciforti, Green & King (1986)
   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   ## Repeating the demand analysis of Blanciforti, Green & King (1986)
   estResult <- aidsEst( c( "pFood1", "pFood2", "pFood3", "pFood4" ),
      c( "wFood1", "wFood2", "wFood3", "wFood4" ), "xFood",
      data = Blanciforti86, priceIndex = "SL" )
   print( summary( estResult ) )



