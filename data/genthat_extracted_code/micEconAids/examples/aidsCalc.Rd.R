library(micEconAids)


### Name: aidsCalc
### Title: Shares and Quantities of the Almost Ideal Demand System
### Aliases: aidsCalc predict.aidsEst
### Keywords: models

### ** Examples

   data( Blanciforti86 )
   # Data on food consumption are available only for the first 32 years
   Blanciforti86 <- Blanciforti86[ 1:32, ]

   priceNames <- c( "pFood1", "pFood2", "pFood3", "pFood4" )
   shareNames <- c( "wFood1", "wFood2", "wFood3", "wFood4" )

   ## LA-AIDS
   estResult <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, priceIndex = "S" )

   # using observed shares in the Stone index
   lnp <- aidsPx( "S", priceNames, Blanciforti86, shareNames )
   fitted <- aidsCalc( priceNames, "xFood", coef = coef( estResult ),
      data = Blanciforti86, priceIndex = lnp )
   fitted$shares  # equal to estResult$wFitted
   fitted$quant   # equal to estResult$qFitted
   # now the same with the predict method
   fitted2 <- predict( estResult, observedShares = TRUE )
   all.equal( fitted, fitted2 ) 

   # using fitted shares in the Stone index
   fitted <- aidsCalc( priceNames, "xFood", coef = estResult$coef,
      data = Blanciforti86, priceIndex = "S" )
   # now the same with the predict method
   fitted2 <- predict( estResult )
   all.equal( fitted, fitted2 ) 

   ## AIDS
   estResult <- aidsEst( priceNames, shareNames, "xFood",
      data = Blanciforti86, method = "IL" )

   fitted <- aidsCalc( priceNames, "xFood", coef = coef( estResult ),
      data = Blanciforti86 )

   fitted$shares  # equal to estResult$wFitted
   fitted$quant   # equal to estResult$qFitted

   fitted2 <- predict( estResult )
   all.equal( fitted, fitted2 ) 



