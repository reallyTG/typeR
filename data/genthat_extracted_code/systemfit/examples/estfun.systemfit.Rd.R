library(systemfit)


### Name: estfun.systemfit
### Title: Extract Gradients of the Objective Function at each Observation
### Aliases: estfun.systemfit
### Keywords: methods

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )
inst <- ~ income + farmPrice + trend

## OLS estimation
fitols <- systemfit( system, "OLS", data = Kmenta )

## obtain the estimation function
library( "sandwich" )
estfun( fitols )

## this is only true for OLS models
all.equal( estfun( fitols ),
   unlist( residuals( fitols ) ) * model.matrix( fitols ) )

# each column should sum up to (approximately) zero
colSums( estfun( fitols ) )


## 2SLS estimation
fit2sls <- systemfit( system, "2SLS", inst = inst, data = Kmenta )

## obtain the estimation function
estfun( fit2sls )

## this is only true for 2SLS models
all.equal( estfun( fit2sls ),
   drop( rep( Kmenta$consump, 2 ) -  model.matrix( fit2sls, which = "xHat" ) %*% 
   coef( fit2sls ) ) * model.matrix( fit2sls, which = "xHat" ) )
all.equal( estfun( fit2sls, residFit = FALSE ),
   unlist( residuals( fit2sls ) ) * model.matrix( fit2sls, which = "xHat" ) )

# each column should sum up to (approximately) zero
colSums( estfun( fit2sls ) )
colSums( estfun( fit2sls, residFit = FALSE ) )


## iterated SUR estimation
fitsur <- systemfit( system, "SUR", data = Kmenta, maxit = 100 )

## obtain the estimation function
estfun( fitsur )

## this should be true for SUR and WLS models
all.equal( estfun( fitsur ),
   unlist( residuals( fitsur ) ) * 
   ( ( solve( fitsur$residCovEst ) %x% diag( nrow( Kmenta ) ) ) %*% 
      model.matrix( fitsur ) ), check.attributes = FALSE )

# each column should sum up to (approximately) zero
colSums( estfun( fitsur ) )


## 3SLS estimation
fit3sls <- systemfit( system, "3SLS", inst = inst, data = Kmenta )

## obtain the estimation function
estfun( fit3sls )
estfun( fit3sls, residFit = FALSE )

## this should be true for 3SLS and W2SLS models
all.equal( estfun( fit3sls ),
   drop( rep( Kmenta$consump, 2 ) -  
   model.matrix( fit2sls, which = "xHat" ) %*% coef( fit3sls ) ) * 
   ( ( solve( fit3sls$residCovEst ) %x% diag( nrow( Kmenta ) ) ) %*% 
      model.matrix( fit3sls, which = "xHat" ) ), check.attributes = FALSE )
all.equal( estfun( fit3sls, residFit = FALSE ),
   unlist( residuals( fit3sls ) ) * 
   ( ( solve( fit3sls$residCovEst ) %x% diag( nrow( Kmenta ) ) ) %*% 
      model.matrix( fit3sls, which = "xHat" ) ), check.attributes = FALSE )

# each column should sum up to (approximately) zero
colSums( estfun( fit3sls ) )
colSums( estfun( fit3sls, residFit = FALSE ) )



