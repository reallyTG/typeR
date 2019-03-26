library(micEconCES)


### Name: cesCalc
### Title: Calculate CES function
### Aliases: cesCalc
### Keywords: models

### ** Examples

   data( germanFarms, package = "micEcon" )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of intermediate inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput


   ## Estimate CES: Land & Labor with fixed returns to scale
   cesLandLabor <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms )

   ## Calculate fitted values
   cesCalc( c( "land", "qLabor" ), germanFarms, coef( cesLandLabor ) )


   # variable returns to scale
   cesLandLaborVrs <- cesEst( "qOutput", c( "land", "qLabor" ), germanFarms,
      vrs = TRUE )

   ## Calculate fitted values
   cesCalc( c( "land", "qLabor" ), germanFarms, coef( cesLandLaborVrs ) )



