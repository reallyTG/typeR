library(systemfit)


### Name: bread.systemfit
### Title: Bread for Sandwiches
### Aliases: bread.systemfit
### Keywords: methods

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )
inst <- ~ income + farmPrice + trend

## OLS estimation
fitols <- systemfit( system, "OLS", data = Kmenta )

## obtain the bread
library( "sandwich" )
bread( fitols )

## this is only true for OLS models
all.equal( bread( fitols ),
   solve( crossprod( model.matrix( fitols ) ) / 40 ) )


## 2SLS estimation
fit2sls <- systemfit( system, "2SLS", inst = inst, data = Kmenta )

## obtain the bread
bread( fit2sls )

## this is only true for 2SLS models
all.equal( bread( fit2sls ),
   solve( crossprod( model.matrix( fit2sls, which = "xHat" ) ) / 40 ) )


## iterated SUR estimation
fitsur <- systemfit( system, "SUR", data = Kmenta, maxit = 100 )

## obtain the bread
bread( fitsur )

## this should be true for SUR and WLS models
all.equal( bread( fitsur ),
   solve( t( model.matrix( fitsur ) ) %*%
      (  ( solve( fitsur$residCovEst ) %x% diag( nrow( Kmenta ) ) ) %*% 
      model.matrix( fitsur ) ) / 40 ), check.attributes = FALSE )


## 3SLS estimation
fit3sls <- systemfit( system, "3SLS", inst = inst, data = Kmenta )

## obtain the bread
bread( fit3sls )

## this should be true for 3SLS and W2SLS models
all.equal( bread( fit3sls ),
   solve( t( model.matrix( fit3sls, which = "xHat" ) ) %*%
      (  ( solve( fit3sls$residCovEst ) %x% diag( nrow( Kmenta ) ) ) %*% 
      model.matrix( fit3sls, which = "xHat" ) ) / 40 ), check.attributes = FALSE )



