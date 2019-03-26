library(systemfit)


### Name: systemfit
### Title: Linear Equation System Estimation
### Aliases: systemfit
### Keywords: models regression

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## OLS estimation
fitols <- systemfit( system, data=Kmenta )
print( fitols )

## OLS estimation with 2 restrictions
Rrestr <- matrix(0,2,7)
Rrestr[1,3] <-  1
Rrestr[1,7] <- -1
Rrestr[2,2] <- -1
Rrestr[2,5] <-  1
qrestr <- c( 0, 0.5 )
fitols2 <- systemfit( system, data = Kmenta,
                      restrict.matrix = Rrestr, restrict.rhs = qrestr )
print( fitols2 )

## OLS estimation with the same 2 restrictions in symbolic form
restrict <- c( "demand_income - supply_trend = 0",
   "- demand_price + supply_price = 0.5" )
fitols2b <- systemfit( system, data = Kmenta, restrict.matrix = restrict )
print( fitols2b )

# test whether both restricted estimators are identical
all.equal( coef( fitols2 ), coef( fitols2b ) )

## OLS with restrictions on the coefficients by modifying the regressor matrix
## with argument restrict.regMat
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
print( fitols3 )


## iterated SUR estimation
fitsur <- systemfit( system, "SUR", data = Kmenta, maxit = 100 )
print( fitsur )

## 2SLS estimation
inst <- ~ income + farmPrice + trend
fit2sls <- systemfit( system, "2SLS", inst = inst, data = Kmenta )
print( fit2sls )

## 2SLS estimation with different instruments in each equation
inst1 <- ~ income + farmPrice
inst2 <- ~ income + farmPrice + trend
instlist <- list( inst1, inst2 )
fit2sls2 <- systemfit( system, "2SLS", inst = instlist, data = Kmenta )
print( fit2sls2 )

## 3SLS estimation with GMM-3SLS formula
inst <- ~ income + farmPrice + trend
fit3sls <- systemfit( system, "3SLS", inst = inst, data = Kmenta,
   method3sls = "GMM" )
print( fit3sls )


## Examples how to use systemfit() with panel-like data
## Repeating the SUR estimations in Greene (2003, p. 351)
data( "GrunfeldGreene" )
library( "plm" )
GGPanel <- pdata.frame( GrunfeldGreene, c( "firm", "year" ) )
formulaGrunfeld <- invest ~ value + capital
# SUR
greeneSur <- systemfit( formulaGrunfeld, "SUR",
   data = GGPanel, methodResidCov = "noDfCor" )
summary( greeneSur )
# SUR Pooled
greeneSurPooled <- systemfit( formulaGrunfeld, "SUR",
   data = GGPanel, pooled = TRUE, methodResidCov = "noDfCor",
   residCovWeighted = TRUE )
summary( greeneSurPooled )

## Further examples are in the documentation to the data sets
## 'KleinI' and 'GrunfeldGreene'.



