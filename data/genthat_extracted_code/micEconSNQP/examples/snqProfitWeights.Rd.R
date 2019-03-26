library(micEconSNQP)


### Name: snqProfitWeights
### Title: SNQ Profit function: Weights of prices for normalization
### Aliases: snqProfitWeights
### Keywords: models

### ** Examples

   data( germanFarms, package = "micEcon" )
   germanFarms$qOutput   <- germanFarms$vOutput   / germanFarms$pOutput
   germanFarms$qVarInput <- -germanFarms$vVarInput / germanFarms$pVarInput
   germanFarms$qLabor    <- -germanFarms$qLabor
   priceNames <- c( "pOutput", "pVarInput", "pLabor" )
   quantNames <- c( "qOutput", "qVarInput", "qLabor" )
   snqProfitWeights( priceNames, quantNames, germanFarms )



