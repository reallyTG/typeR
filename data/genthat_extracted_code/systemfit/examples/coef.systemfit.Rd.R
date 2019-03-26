library(systemfit)


### Name: coef.systemfit
### Title: Coefficients of systemfit object
### Aliases: coef.systemfit coef.systemfit.equation coef.summary.systemfit
###   coef.summary.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS on each of the equations in the system
fitols <- systemfit( system, data = Kmenta )

## all coefficients
coef( fitols )
coef( summary( fitols ) )

## coefficients of the first equation
coef( fitols$eq[[1]] )
coef( summary( fitols$eq[[1]] ) )

## coefficients of the second equation
coef( fitols$eq[[2]] )
coef( summary( fitols$eq[[2]] ) )

## estimation with restriction by modifying the regressor matrix
modReg <- matrix( 0, 7, 6 )
colnames( modReg ) <- c( "demIntercept", "demPrice", "demIncome",
   "supIntercept", "supPrice2", "supTrend" )
modReg[ 1, "demIntercept" ] <- 1
modReg[ 2, "demPrice" ]     <- 1
modReg[ 3, "demIncome" ]    <- 1
modReg[ 4, "supIntercept" ] <- 1
modReg[ 5, "supPrice2" ]    <- 1
modReg[ 6, "supPrice2" ]    <- 1
modReg[ 7, "supTrend" ]     <- 1
fitols3 <- systemfit( system, data = Kmenta, restrict.regMat = modReg )
coef( fitols3, modified.regMat  = TRUE )
coef( fitols3 )



