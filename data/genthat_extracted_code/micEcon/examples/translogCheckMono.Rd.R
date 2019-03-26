library(micEcon)


### Name: translogCheckMono
### Title: Monotonicity of a Translog Function
### Aliases: translogCheckMono print.translogCheckMono
###   summary.translogCheckMono print.summary.translogCheckMono
### Keywords: models

### ** Examples

   data( germanFarms )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of variable inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput
   # a time trend to account for technical progress:
   germanFarms$time <- c(1:20)

   # estimate a translog production function
   estResult <- translogEst( "qOutput", c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms )

   # check whether the production function is monotonically increasing
   # in all inputs
   test <- translogCheckMono( xNames = c( "qLabor", "land", "qVarInput", "time" ),
      data = germanFarms, coef = coef( estResult ) )
   test
   summary( test )

   # check whether the production function is monotonically decreasing
   # in time and monotonically increasing in all other inputs
   test <- translogCheckMono( c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms, coef( estResult ), increasing = c( TRUE, TRUE, TRUE, FALSE ) )
   test
   summary( test )



