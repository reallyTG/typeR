library(gamlss.util)


### Name: centiles.ts
### Title: Plots the centile curves for a time series GAMLSS object
### Aliases: centiles.ts
### Keywords: regression

### ** Examples


## Not run: 
##D library(gamlss.add)
##D dax <- EuStockMarkets[,"DAX"]
##D # returs
##D rdax <- diff(dax,1)
##D   w1 <- wlag(rdax,30)
##D # garch type 
##D f1<- gamlss(rdax~ la(rdax, lags=30, from.lag=1), sigma.fo=~la(rdax^2, 
##D             lags=30, from.lag=1), weights=w1, bf.cyc=10, family=TF)
##D tiR <- as.numeric(time(rdax))
##D centiles.ts(f1, xvar=tiR, cent=c(2.5,50,97.5), col.cent="black")
## End(Not run)



