library(micEcon)


### Name: translogCalc
### Title: Calculate dependent variable of a translog function
### Aliases: translogCalc
### Keywords: models

### ** Examples

   data( germanFarms )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of variable inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput
   # a time trend to account for technical progress:
   germanFarms$time <- c(1:20)

   # estimate a Translog production function
   estResult <- translogEst( "qOutput", c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms )

   translogCalc( c( "qLabor", "land", "qVarInput", "time" ), germanFarms,
      coef( estResult ) )
   #equal to estResult$fitted



