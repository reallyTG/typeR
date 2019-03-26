library(micEconSNQP)


### Name: snqProfitFixEla
### Title: Fixed Factor Elasticities of SNQ Profit function
### Aliases: snqProfitFixEla
### Keywords: models

### ** Examples

   # just a stupid simple example
   snqProfitFixEla( matrix(1:6/6,3,2 ), matrix(4:1/4,2 ), c(1,1,1), c(1,1),
      c(0.4,0.3,0.3) )

   # now with real data
   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput   / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   germanFarms$time      <- c( 0:19 )
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )
   fixNames <- c( "land", "time" )

   estResult <- snqProfitEst( priceNames, quantNames, fixNames, data=germanFarms )

   estResult$fixEla  # price elasticities at mean quantities of netputs
                     # and fixed factors

   # fixed factor elasticities at the last observation (1994/95)
   snqProfitFixEla( estResult$coef$delta, estResult$coef$gamma,
      estResult$data[ 20, quantNames ], estResult$data[ 20, fixNames ],
      estResult$weights, estResult$scalingFactors )



