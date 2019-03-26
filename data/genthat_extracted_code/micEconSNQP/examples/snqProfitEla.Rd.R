library(micEconSNQP)


### Name: snqProfitEla
### Title: Price Elasticities of SNQ Profit function
### Aliases: snqProfitEla
### Keywords: models

### ** Examples

   # just a stupid simple example
   snqProfitEla( matrix(101:109,3,3), c(1,1,1), c(1,-1,-1), c(0.4,0.3,0.3) )

   # now with real data
   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput   / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   germanFarms$time      <- c( 0:19 )
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )

   estResult <- snqProfitEst( priceNames, quantNames, c("land","time"), data=germanFarms )

   estResult$ela  # price elasticities at mean prices and mean quantities

   # price elasticities at the last observation (1994/95)
   snqProfitEla( estResult$coef$beta, estResult$data[ 20, priceNames ],
      estResult$data[ 20, quantNames ], estResult$weights,
      estResult$scalingFactors )



