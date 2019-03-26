library(micEcon)


### Name: translogCheckCurvature
### Title: Curvature of a Translog Function
### Aliases: translogCheckCurvature print.translogCheckCurvature
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

   # check whether the production function is quasiconcave
   translogCheckCurvature( c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms, coef( estResult ), convexity = FALSE, quasi = TRUE )



