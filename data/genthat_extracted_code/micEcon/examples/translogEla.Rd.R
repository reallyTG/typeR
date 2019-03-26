library(micEcon)


### Name: translogEla
### Title: Elasticities of a translog Function
### Aliases: translogEla elas.translogEst
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

   # calculate production elasticities of all inputs
   estEla <- translogEla( c( "qLabor", "land", "qVarInput", "time" ), 
      data = germanFarms, coef = coef( estResult ), 
      coefCov = vcov( estResult ) )
   # all elasticities
   estEla
   # t-values of all elasticities
   estEla / attributes( estEla )$stdDev



