library(micEcon)


### Name: translogProdFuncMargCost
### Title: Marginal Costs of Translog Production Function
### Aliases: translogProdFuncMargCost
### Keywords: models

### ** Examples

   data( germanFarms )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # quantity of variable inputs
   germanFarms$qVarInput <- germanFarms$vVarInput / germanFarms$pVarInput
   # a time trend to account for technical progress:
   germanFarms$time <- c(1:20)

   # generate (artificial) prices
   germanFarms$pLand <- 200 + 15 * germanFarms$time
   germanFarms$pTime <- 1

   # estimate a single-output translog production function
   estResult <- translogEst( "qOutput", c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms )

   # compute the marginal costs of producing the output
   margCost <- translogProdFuncMargCost( yName = "qOutput",
      xNames = c( "qLabor", "land", "qVarInput", "time" ),
      wNames = c( "pLabor", "pLand", "pVarInput", "pTime" ),
      data = germanFarms, coef = coef( estResult ) )



