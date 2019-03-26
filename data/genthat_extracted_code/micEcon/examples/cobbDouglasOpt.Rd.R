library(micEcon)


### Name: cobbDouglasOpt
### Title: Optimal Values of Independent Variables of a Cobb-Douglas
###   Function
### Aliases: cobbDouglasOpt
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
   estResult <- translogEst( yName = "qOutput",
      xNames = c( "qLabor", "qVarInput", "land", "time" ),
      data = germanFarms, linear = TRUE )

   # calculate optimal quantities of variable inputs
   xCoef <- coef( estResult )[ 1:3 ]
   zCoef <- coef( estResult )[ 4:5 ]
   names( zCoef ) <- c( "d_1", "d_2" )
   optInput <- cobbDouglasOpt( pyName = "pOutput",
      pxNames = c( "pLabor", "pVarInput" ), coef = xCoef,
      data = germanFarms, xNames = c( "qLabor", "qVarInput" ),
      zNames = c( "land", "time" ), zCoef = zCoef )

   # compare observed with optimal input quantities
   plot( germanFarms$qLabor, optInput$qLabor )
   plot( germanFarms$qVarInput, optInput$qVarInput )



