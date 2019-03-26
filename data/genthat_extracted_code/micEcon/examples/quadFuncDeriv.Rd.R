library(micEcon)


### Name: quadFuncDeriv
### Title: Derivatives of a quadratic function
### Aliases: quadFuncDeriv
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

   # compute the marginal products of the inputs
   margProducts <- quadFuncDeriv( c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms, coef( estResult ), vcov( estResult ) )
   # all marginal products
   margProducts
   # their t-values
   margProducts / attributes( margProducts )$stdDev



