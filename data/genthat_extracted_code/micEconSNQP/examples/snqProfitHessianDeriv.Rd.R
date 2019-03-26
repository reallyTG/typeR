library(micEconSNQP)


### Name: snqProfitHessianDeriv
### Title: SNQ Profit function: Derivatives of the Hessian
### Aliases: snqProfitHessianDeriv
### Keywords: models

### ** Examples

   # just a stupid simple example
   snqProfitHessianDeriv( c(1,2,3),c(0.4,0.3,0.3) )

   # now with real data
   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput   / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   germanFarms$time <- c( 0:19 )
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )

   estResult <- snqProfitEst( priceNames, quantNames, c("land","time"), data=germanFarms )

   snqProfitHessianDeriv( estResult$pMean, estResult$weights, 2 )



