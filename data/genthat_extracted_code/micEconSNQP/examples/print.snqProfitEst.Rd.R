library(micEconSNQP)


### Name: print.snqProfitEst
### Title: Print output of estimated SNQ profit function
### Aliases: print.snqProfitEst
### Keywords: models

### ** Examples

## Not run: library( systemfit )
   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )

   estResult <- snqProfitEst( priceNames, quantNames, "land", data = germanFarms )
   print( estResult )



