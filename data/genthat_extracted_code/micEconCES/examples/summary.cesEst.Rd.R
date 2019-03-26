library(micEconCES)


### Name: summary.cesEst
### Title: Summarize Estimation of a CES Function
### Aliases: summary.cesEst print.summary.cesEst
### Keywords: models

### ** Examples

   data( germanFarms, package = "micEcon" )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of intermediate inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput


   ## CES: Land & Labor
   cesLandLabor <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms )

   # print summary results
   summary( cesLandLabor )



