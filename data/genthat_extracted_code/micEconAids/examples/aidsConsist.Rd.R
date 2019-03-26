library(micEconAids)


### Name: aidsConsist
### Title: Check Consistency of the AIDS
### Aliases: aidsConsist print.aidsConsist checkConsist.aidsEst
### Keywords: models

### ** Examples

   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   priceNames <- c( "pFood1", "pFood2", "pFood3", "pFood4" )
   shareNames <- c( "wFood1", "wFood2", "wFood3", "wFood4" )

   estResult <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, method = "IL" )
   aidsConsist( priceNames, "xFood", data = Blanciforti86,
      coef = estResult$coef )

   # the same can be obtained in an easier way
   checkConsist( estResult )



