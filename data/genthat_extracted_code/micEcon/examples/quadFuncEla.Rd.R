library(micEcon)


### Name: quadFuncEla
### Title: Elasticities of a Quadratic Function
### Aliases: quadFuncEla elas.quadFuncEst
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
   estResult <- quadFuncEst( yName = "qOutput", 
      xNames = c( "qLabor", "land", "qVarInput", "time" ),
      data = germanFarms )

   # compute the partial production elasticities with "fitted" output
   elaFit <- quadFuncEla( xNames = c( "qLabor", "land", "qVarInput", "time" ),
      data = germanFarms, coef = coef( estResult ) )
   elaFit
   # same as
   elaFit2 <- elas( estResult )
   all.equal( elaFit, elaFit2 )

   # compute the partial production elasticities with observed output
   elaObs <- quadFuncEla( xNames = c( "qLabor", "land", "qVarInput", "time" ),
      data = germanFarms, coef = coef( estResult ), yName = "qOutput" )
   elaObs
   # same as
   elaObs2 <- elas( estResult, yObs = TRUE )
   all.equal( elaObs, elaObs2 )



