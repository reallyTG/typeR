library(micEconSNQP)


### Name: snqProfitCalc
### Title: Calculations with the SNQ Profit function
### Aliases: snqProfitCalc
### Keywords: models

### ** Examples

   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   germanFarms$time      <- c( 0:19 )
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )
   fixNames <- c( "land", "time" )

   estResult <- snqProfitEst( priceNames, quantNames, fixNames, data = germanFarms )
   snqProfitCalc( priceNames, fixNames, estResult$data, estResult$weights,
      estResult$scalingFactors, estResult$coef )



