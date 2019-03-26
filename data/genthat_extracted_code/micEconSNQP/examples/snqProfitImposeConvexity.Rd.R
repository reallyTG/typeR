library(micEconSNQP)


### Name: snqProfitImposeConvexity
### Title: Imposing Convexity on a SNQ Profit function
### Aliases: snqProfitImposeConvexity
### Keywords: models

### ** Examples

   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )
   estResult <- snqProfitEst( priceNames, quantNames, "land", data = germanFarms )
   estResult  # Note: it is NOT convex in netput prices
   estResultConvex <- snqProfitImposeConvexity( estResult )
   estResultConvex  # now it is convex



