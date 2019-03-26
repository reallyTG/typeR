library(fGarch)


### Name: garchFit
### Title: Univariate GARCH Time Series Fitting
### Aliases: garchFit garchKappa
### Keywords: models

### ** Examples
  
## UNIVARIATE TIME SERIES INPUT:
   # In the univariate case the lhs formula has not to be specified ... 
   
   # A numeric Vector from default GARCH(1,1) - fix the seed:
   N = 200
   x.vec = as.vector(garchSim(garchSpec(rseed = 1985), n = N)[,1])
   garchFit(~ garch(1,1), data = x.vec, trace = FALSE)

   # An univariate timeSeries object with dummy dates:
   x.timeSeries = dummyDailySeries(matrix(x.vec), units = "GARCH11")
   garchFit(~ garch(1,1), data = x.timeSeries, trace = FALSE)         

## Not run: 
##D    # An univariate zoo object:
##D    x.zoo = zoo(as.vector(x.vec), order.by = as.Date(rownames(x.timeSeries)))
##D    garchFit(~ garch(1,1), data = x.zoo, trace = FALSE) 
## End(Not run)

   # An univariate "ts" object:
   x.ts = as.ts(x.vec)
   garchFit(~ garch(1,1), data = x.ts, trace = FALSE)
    
## MULTIVARIATE TIME SERIES INPUT:
   # For multivariate data inputs the lhs formula must be specified ...
   
   # A numeric matrix binded with dummy random normal variates:
   X.mat = cbind(GARCH11 = x.vec, R = rnorm(N))
   garchFit(GARCH11 ~ garch(1,1), data = X.mat)
        
   # A multivariate timeSeries object with dummy dates:
   X.timeSeries = dummyDailySeries(X.mat, units = c("GARCH11", "R")) 
   garchFit(GARCH11 ~ garch(1,1), data = X.timeSeries)

## Not run: 
##D     
##D    # A multivariate zoo object:
##D    X.zoo = zoo(X.mat, order.by = as.Date(rownames(x.timeSeries)))
##D    garchFit(GARCH11 ~ garch(1,1), data = X.zoo)
## End(Not run)

   # A multivariate "mts" object:
   X.mts = as.ts(X.mat)
   garchFit(GARCH11 ~ garch(1,1), data = X.mts)
 
## MODELING THE PERCENTUAL SPI/SBI SPREAD FROM LPP BENCHMARK:
    
   X.timeSeries = as.timeSeries(data(LPP2005REC))
   X.mat = as.matrix(x.timeSeries)
   ## Not run: X.zoo = zoo(X.mat, order.by = as.Date(rownames(X.mat)))
   X.mts = ts(X.mat)
   garchFit(100*(SPI - SBI) ~ garch(1,1), data = X.timeSeries)
   # The remaining are not yet supported ...
   # garchFit(100*(SPI - SBI) ~ garch(1,1), data = X.mat)
   # garchFit(100*(SPI - SBI) ~ garch(1,1), data = X.zoo)
   # garchFit(100*(SPI - SBI) ~ garch(1,1), data = X.mts)
    
## MODELING HIGH/LOW RETURN SPREADS FROM MSFT PRICE SERIES:
    
   X.timeSeries = MSFT
   garchFit(Open ~ garch(1,1), data = returns(X.timeSeries)) 
   garchFit(100*(High-Low) ~ garch(1,1), data = returns(X.timeSeries)) 



