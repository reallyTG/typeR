library(micEconSNQP)


### Name: snqProfitShadowPrices
### Title: Shadow Prices of a SNQ Profit function
### Aliases: snqProfitShadowPrices
### Keywords: models

### ** Examples

   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput   / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   germanFarms$time      <- c( 0:19 )
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )
   fixNames <- c( "land", "time" )

   estResult <- snqProfitEst( priceNames, quantNames, fixNames, data = germanFarms )

   snqProfitShadowPrices( priceNames, fixNames, estResult )



