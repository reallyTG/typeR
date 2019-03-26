library(micEcon)


### Name: translogCostEst
### Title: Estimate a translog Cost Function
### Aliases: translogCostEst
### Keywords: models

### ** Examples

   data( germanFarms )
   # output quantity:
   germanFarms$qOutput <- germanFarms$vOutput / germanFarms$pOutput
   # value of labor input
   germanFarms$vLabor <- germanFarms$pLabor + germanFarms$qLabor
   # total variable cost
   germanFarms$cost <- germanFarms$vLabor + germanFarms$vVarInput
   # a time trend to account for technical progress:
   germanFarms$time <- c(1:20)

   # estimate a translog cost function
   estResult <- translogCostEst( cName = "cost", yName = "qOutput", 
      pNames = c( "pLabor", "pVarInput" ), fNames = "land",
      shifterNames = "time", data = germanFarms, homPrice = FALSE )

   summary( estResult$est )



