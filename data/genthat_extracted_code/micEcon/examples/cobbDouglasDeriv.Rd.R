library(micEcon)


### Name: cobbDouglasDeriv
### Title: Derivatives of a Cobb-Douglas function
### Aliases: cobbDouglasDeriv
### Keywords: models

### ** Examples

   data( germanFarms )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of variable inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput
   # a time trend to account for technical progress:
   germanFarms$time <- c(1:20)

   # estimate a Cobb-Douglas production function
   estResult <- translogEst( "qOutput", c( "qLabor", "qVarInput", "land", "time" ),
      germanFarms, linear = TRUE )

   # compute the marginal products of the inputs (with "fitted" Output)
   margProducts <- cobbDouglasDeriv( c( "qLabor", "qVarInput", "land", "time" ),
      data = germanFarms, coef = coef( estResult )[1:5],
      coefCov = vcov( estResult )[1:5,1:5] )
   margProducts$deriv
   # t-values
   margProducts$deriv / margProducts$variance^0.5

   # compute the marginal products of the inputs (with observed Output)
   margProductsObs <- cobbDouglasDeriv( c( "qLabor", "qVarInput", "land", "time" ),
      data = germanFarms, coef = coef( estResult )[1:5], yName = "qOutput",
      coefCov = vcov( estResult )[1:5,1:5] )
   margProductsObs$deriv
   # t-values
   margProductsObs$deriv / margProductsObs$variance^0.5



