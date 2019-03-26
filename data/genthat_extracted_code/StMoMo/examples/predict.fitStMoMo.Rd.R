library(StMoMo)


### Name: predict.fitStMoMo
### Title: Predict method for Stochastic Mortality Models fits
### Aliases: predict.fitStMoMo

### ** Examples


## Not run: 
##D ##M6 Forecast using VARIMA(1,1) model
##D library(MTS)
##D 
##D # fit m6
##D years <- EWMaleData$years
##D ages.fit <- 55:89
##D M6 <- m6(link = "log")
##D M6fit <- fit(M6, data = EWMaleData, ages.fit = ages.fit)
##D 
##D # Forecast kt using VARIMA(1,1) model from MTS
##D h <- 50
##D kt.M6 <- t(M6fit$kt) 
##D kt.M6.diff <- apply(kt.M6, 2, diff)
##D fit.kt.M6.11 <- VARMA(kt.M6.diff, p = 1, q = 1)
##D pred.ktdiff.M6.11 <- VARMApred(fit.kt.M6.11, h = h)
##D pred.kt.M6.11 <- apply(rbind(tail(kt.M6, n = 1),
##D                              pred.ktdiff.M6.11$pred), 
##D                        2, cumsum)[-1, ]
##D 
##D # set row names
##D years.forecast <- seq(tail(years, 1) + 1, length.out = h)
##D rownames(pred.kt.M6.11) <- years.forecast
##D 
##D # plot kt1
##D plot(x = c(years, years.forecast),
##D      y = c(kt.M6[, 1], pred.kt.M6.11[, 1]),
##D      col = rep(c("black", "red"), times = c(length(years), h)),
##D      xlab = "time",
##D      ylab = "k1")
##D 
##D plot(x = c(years, years.forecast),
##D      y = c(kt.M6[, 2], pred.kt.M6.11[, 2]),
##D      col = rep(c("black", "red"), times = c(length(years), h)),
##D      xlab = "time",
##D      ylab = "k2")
##D 
##D # forecast cohort effect
##D # the following cohorts are required:
##D # from 2012 - 89 = 1923
##D # to 2061 - 55 = 2006
##D pred.gc.M6 <- forecast(auto.arima(M6fit$gc, max.d = 1), h = h)
##D 
##D # use predict to get rates
##D pred.qxt.M6.11 <- predict(object = M6fit,
##D                           years = years.forecast,
##D                           kt = t(pred.kt.M6.11),
##D                           gc = c(tail(M6fit$gc, 34), pred.gc.M6$mean),
##D                           type = "rates")
##D 
##D qxthatM6 <- fitted(M6fit, type = "rates")
##D 
##D # plot mortality profile at age 60, 70 and 80
##D matplot(1961 : 2061,
##D         t(cbind(qxthatM6, pred.qxt.M6.11)[c("60", "70", "80"), ]),
##D         type = "l", col = "black", xlab = "years", ylab = "rates",
##D         lwd = 1.5)
## End(Not run)



