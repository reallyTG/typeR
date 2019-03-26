library(systemfit)


### Name: vcov.systemfit
### Title: Variance covariance matrix of coefficients
### Aliases: vcov.systemfit vcov.systemfit.equation
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## perform OLS on each of the equations in the system
fitols <- systemfit( system, data = Kmenta )

## variance covariance matrix of all coefficients
vcov( fitols )

## variance covariance matrix of the coefficients in the first equation
vcov( fitols$eq[[1]] )

## variance covariance matrix of the coefficients in the second equation
vcov( fitols$eq[[2]] )

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
fitsur <- systemfit( system, "SUR", data = Kmenta, restrict.regMat = modReg )
vcov( fitsur, modified.regMat  = TRUE )
vcov( fitsur )



