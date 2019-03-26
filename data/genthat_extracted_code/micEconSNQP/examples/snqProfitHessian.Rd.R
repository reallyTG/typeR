library(micEconSNQP)


### Name: snqProfitHessian
### Title: SNQ Profit function: Hessian matrix
### Aliases: snqProfitHessian
### Keywords: models

### ** Examples

   # just a stupid simple example
   snqProfitHessian( matrix(101:109,3,3), c(1,1,1), c(0.4,0.3,0.3) )

   # now with real data
   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput   / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   germanFarms$time <- c( 0:19 )
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )

   estResult <- snqProfitEst( priceNames, quantNames, c("land","time"), data=germanFarms )

   estResult$hessian  # the Hessian at mean prices and mean quantities

   # Hessian at the last observation (1994/95)
   snqProfitHessian( estResult$coef$beta, estResult$data[ 20, priceNames ],
      estResult$weights, estResult$scalingFactors )



