library(micEconSNQP)


### Name: snqProfitEst
### Title: Estimation of a SNQ Profit function
### Aliases: snqProfitEst
### Keywords: models

### ** Examples

   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )

   estResult <- snqProfitEst( priceNames, quantNames, "land", data = germanFarms )
   estResult$ela   # Oh, that looks bad!

   # it it reasonable to account for technological progress
   germanFarms$time <- c( 0:19 )
   estResult2 <- snqProfitEst( priceNames, quantNames, c("land","time"), 
      data = germanFarms )
   estResult2$ela   # Ah, that looks better!
   
   # estimation with unscaled prices
   estResultNoScale <- snqProfitEst( priceNames, quantNames, c("land","time"), 
    data = germanFarms, scalingFactors = rep( 1, 3 ) )
   print( estResultNoScale )
   
   # alternative way of estimation with unscaled prices
   estResultNoScale2 <- snqProfitEst( priceNames, quantNames, c("land","time"), 
      data = germanFarms, base = NULL, 
      weights = snqProfitWeights( priceNames, quantNames, germanFarms ) )
   all.equal( estResultNoScale[-20], estResultNoScale2[] )

   # please note that the SNQ Profit function is not invariant
   # to units of measurement so that different scaling factors 
   # result in different estimates of elasticities:
   all.equal( estResult2$ela, estResultNoScale$ela )



