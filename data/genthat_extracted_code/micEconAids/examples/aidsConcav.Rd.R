library(micEconAids)


### Name: aidsConcav
### Title: Concavity of the AIDS
### Aliases: aidsConcav print.aidsConcav
### Keywords: models

### ** Examples

   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   priceNames <- c( "pFood1", "pFood2", "pFood3", "pFood4" )
   shareNames <- c( "wFood1", "wFood2", "wFood3", "wFood4" )

   # estimate the AIDS
   estResult <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, method = "IL" )

   # check concavity with fitted shares
   aidsConcav( priceNames, "xFood", coef = estResult$coef,
      data = Blanciforti86 )

   # check concavity with observed shares
   aidsConcav( priceNames, "xFood", coef = estResult$coef,
      data = Blanciforti86, shareNames = shareNames )



