library(micEconAids)


### Name: aidsUtility
### Title: Indirect Utility Function of the Almost Ideal Demand System
### Aliases: aidsUtility aidsUtilityDeriv
### Keywords: models

### ** Examples

   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   priceNames <- c( "pFood1", "pFood2", "pFood3", "pFood4" )
   shareNames <- c( "wFood1", "wFood2", "wFood3", "wFood4" )

   ## estimate the (non-linear) AIDS
   estResult <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, method = "IL" )

   # calculate the utility levels of each year
   utility <- aidsUtility( priceNames, "xFood", coef = coef( estResult ),
      data = Blanciforti86 )

   utilityDeriv <- aidsUtilityDeriv( priceNames, "xFood",
      coef = coef( estResult ), data = Blanciforti86 )

   utilityEla <- aidsUtilityDeriv( priceNames, "xFood",
      coef = coef( estResult ), data = Blanciforti86, rel = TRUE )



