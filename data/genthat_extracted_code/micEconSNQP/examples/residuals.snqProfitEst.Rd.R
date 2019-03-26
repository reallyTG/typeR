library(micEconSNQP)


### Name: residuals.snqProfitEst
### Title: Residuals of an SNQ profit function
### Aliases: residuals.snqProfitEst residuals.snqProfitImposeConvexity
### Keywords: models

### ** Examples

   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   germanFarms$time      <- c( 0:19 )
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )
   estResult <- snqProfitEst( priceNames, quantNames, c("land","time"), data=germanFarms )
   residuals( estResult )
   residuals( estResult, scaled = FALSE )



