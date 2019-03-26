library(micEconAids)


### Name: aidsMono
### Title: Monotonicity of the AIDS
### Aliases: aidsMono print.aidsMono
### Keywords: models

### ** Examples

   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   priceNames <- c( "pFood1", "pFood2", "pFood3", "pFood4" )
   shareNames <- c( "wFood1", "wFood2", "wFood3", "wFood4" )

   ## AIDS
   estResult <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, method = "IL" )
   aidsMono( priceNames, "xFood", coef = coef( estResult ),
      data = Blanciforti86 )

   ## LA-AIDS with Tornqvist price index
   estResultLaT <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, priceIndex = "T" )
   # with fitted expenditure shares in the price index
   aidsMono( priceNames, "xFood", coef = coef( estResultLaT ),
      data = Blanciforti86, priceIndex = "T",
      basePrices = estResultLaT$basePrices,
      baseShares = estResultLaT$baseShares )
   # with observed expenditure shares in the price index
   aidsMono( priceNames, "xFood", coef = coef( estResultLaT ),
      data = Blanciforti86, priceIndex = estResultLaT$lnp )



