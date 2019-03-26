library(micEcon)


### Name: translogHessian
### Title: Hessian matrix of a translog function
### Aliases: translogHessian
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
   estResult <- translogEst( "qOutput", c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms )

   # compute the Hessian matrices (with "fitted" output)
   hessians <- translogHessian( c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms, coef( estResult ) )
   hessians[[ 1 ]]

   # compute the Hessian matrices (with observed output)
   hessiansObs <- translogHessian( c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms, coef( estResult ), "qOutput" )
   hessiansObs[[ 1 ]]

   # compute the bordered Hessian matrices
   borderedHessians <- translogHessian( c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms, coef( estResult ), bordered = TRUE )
   borderedHessians[[ 1 ]]



