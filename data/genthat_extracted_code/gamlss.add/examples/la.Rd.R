library(gamlss.add)


### Name: la
### Title: An Additive term for fitting Penalised Lags within a GAMLSS
###   model
### Aliases: la la.control gamlss.la
### Keywords: regression ts

### ** Examples

##  the data
 dax <- EuStockMarkets[,"DAX"]
 plot(dax)
## using a penalised autorgressive model
   w <- wlag(dax, lag=20)
  m1 <- gamlss(dax~ la(dax, lags=20, order=1, from.lag=1), weights=w) 
  lines(fitted(m1)~as.numeric(time(dax)), col=2)
 wp(m1, ylim.all=1) # not very good model
## Not run: 
##D ## Try modelling the variance
##D   m2 <- gamlss(dax~ la(dax, lags=20, order=1, from.lag=1),
##D               sigma.fo=~la(dax^2, lags=10, order=1, from.lag=1), weights=w)
##D  wp(m2, ylim.all=1)# maybe the tails
##D   m3 <- gamlss(dax~ la(dax, lags=20, order=1, from.lag=1),
##D               sigma.fo=~la(dax^2, lags=10, order=1, from.lag=1), 
##D               weights=w,  family=TF)
##D   wp(m3, ylim.all=1) # better model 
##D   plot(m3, ts=TRUE)  # autocorrelation OK
##D ## using FTSE to precict DAX           
##D ftse <- EuStockMarkets[,"FTSE"]
##D # fitting using penLags
##D   l1 <- penLags(dax, ftse, lags=30, plot=TRUE)
##D # similar model within gamlss  
##D    w <- wlag(ftse, lag=30)
##D   g1 <- gamlss(dax~ la(ftse, lags=30, order=1), weights=w)
##D lines(fitted(m1)~as.numeric(time(dax)))
##D   op <- par(mfrow=c(2,1))
##D # plotting the fitted coeficints of the AR terms  
##D plot(coef(l1, "AR"), type="h")
##D plot(coef(g1$mu.coefSmo[[1]])[-1], type="h")
##D par(op)
##D g2 <- gamlss(dax~ la(ftse, lags=30, order=1)+la(dax, lags=20, order=1, from.lag=1) , weights=w)
##D g3 <- gamlss(dax~ la(ftse, lags=30, order=1)+la(dax, lags=20, order=1, from.lag=1) ,
##D                 sigma.fo=~la(dax^2, lags=10, order=1, from.lag=1), weights=w)
## End(Not run)


