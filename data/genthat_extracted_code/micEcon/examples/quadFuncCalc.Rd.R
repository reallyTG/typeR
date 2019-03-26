library(micEcon)


### Name: quadFuncCalc
### Title: Calculate dependent variable of a quadratic function
### Aliases: quadFuncCalc
### Keywords: models

### ** Examples

   data( germanFarms )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of variable inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput
   # a time trend to account for technical progress:
   germanFarms$time <- c(1:20)

   # estimate a quadratic production function
   estResult <- quadFuncEst( "qOutput", c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms )

   quadFuncCalc( c( "qLabor", "land", "qVarInput", "time" ), germanFarms,
      coef( estResult ) )
   #equal to estResult$fitted



