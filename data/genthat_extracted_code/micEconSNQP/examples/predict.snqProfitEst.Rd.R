library(micEconSNQP)


### Name: predict.snqProfitEst
### Title: Predictions from an SNQ profit function
### Aliases: predict.snqProfitEst predict.snqProfitImposeConvexity
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
   predict( estResult )
   predict( estResult, se.fit = TRUE, se.pred = TRUE, interval = "confidence" )



