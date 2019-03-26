library(micEcon)


### Name: cobbDouglasCalc
### Title: Calculate dependent variable of a Cobb-Douglas function
### Aliases: cobbDouglasCalc
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
   estResult <- translogEst( "qOutput", c( "qLabor", "land", "qVarInput", "time" ),
      germanFarms, linear = TRUE )

   # fitted values
   fitted <- cobbDouglasCalc( c( "qLabor", "land", "qVarInput", "time" ), germanFarms,
      coef( estResult )[ 1:5 ] )
   #equal to estResult$fitted

   # fitted values and their variances
   fitted2 <- cobbDouglasCalc( c( "qLabor", "land", "qVarInput", "time" ), germanFarms,
      coef( estResult )[ 1:5 ], coefCov = vcov( estResult )[ 1:5, 1:5 ] )
   # t-values
   c( fitted2 ) / attributes( fitted2 )$variance^0.5



