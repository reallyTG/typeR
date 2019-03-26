library(StMoMo)


### Name: forecast.fitStMoMo
### Title: Forecast mortality rates using a Stochastic Mortality Model
### Aliases: forecast.fitStMoMo

### ** Examples

#Lee-Carter (random walk with drift)
LCfit <- fit(lc(), data = EWMaleData, ages.fit = 55:89)
LCfor <- forecast(LCfit)
plot(LCfor)

#Lee-Carter (forecast with ARIMA(1,1,2) with drift )
LCfor.iarima1 <- forecast(LCfit, kt.method = "iarima", kt.order = c(1, 1 , 2))
plot(LCfor.iarima1)

#Lee-Carter (forecast with auto.arima)
LCfor.iarima2 <- forecast(LCfit, kt.method = "iarima")
plot(LCfor.iarima2)

#CBD (Multivariate random walk with drift)
CBDfit <- fit(cbd(), data = central2initial(EWMaleData), ages.fit = 55:89)
CBDfor <- forecast(CBDfit)
plot(CBDfor, parametricbx = FALSE)

#CBD (Independent Arima models)
kt.order <- matrix(c(1, 1, 2,  #ARIMA(1, 1, 2) for k[1]
                     0, 1, 1), #ARIMA(0, 1, 1) for k[2]
                   nrow = 2, ncol = 3, byrow = TRUE)
CBDfor.iarima <- forecast(CBDfit, kt.method = "iarima", kt.order = kt.order)
plot(CBDfor.iarima, parametricbx = FALSE)

#APC: Compare forecast with different models for the cohort index
wxt <- genWeightMat(55:89,  EWMaleData$years, clip = 3)
APCfit <- fit(apc(), data = EWMaleData,  ages.fit = 55:89, 
              wxt = wxt)
APCfor1 <- forecast(APCfit)
plot(APCfor1, parametricbx = FALSE, nCol = 3)
APCfor2 <- forecast(APCfit, gc.order = c(0, 2, 2))
plot(APCfor2, only.gc = TRUE)
plot(c(APCfit$years, APCfor1$years), 
     cbind(APCfor1$fitted, APCfor1$rates)["65", ], 
     type = "l", xlab = "year", ylab = "Mortality rate at age 65", 
     main = "Forecasts with different models for gc")
lines(APCfor2$years, APCfor2$rates["65", ], col = "blue")
points(APCfit$years, (APCfit$Dxt / APCfit$Ext)["65", ], pch = 19) 

#Compare Lee-Carter forecast using: 
#  1. Fitted jump-off rates and all history for kt
#  2. Actual jump-off rates and all history for kt
#  3. Fitted jump-off rates and only history for 
#     the past 30 years of kt (i.e 1982-2011)

LCfor1 <- forecast(LCfit)
LCfor2 <- forecast(LCfit, jumpchoice = "actual")
LCfor3 <- forecast(LCfit, kt.lookback = 30) 

plot(LCfit$years, (LCfit$Dxt / LCfit$Ext)["60", ],
     xlim = range(LCfit$years, LCfor1$years),
     ylim = range((LCfit$Dxt / LCfit$Ext)["60", ], LCfor1$rates["60", ],
                  LCfor2$rates["60", ], LCfor3$rates["60", ]),
     type = "p", xlab = "year", ylab = "rate",
     main = "Lee-Carter: Forecast of mortality rates at age 60")
lines(LCfit$years, fitted(LCfit, type = "rates")["60", ])
lines(LCfor1$years, LCfor1$rates["60", ], lty = 2)
lines(LCfor2$years, LCfor2$rates["60", ], lty = 3, col = "blue")
lines(LCfor3$years, LCfor3$rates["60", ], lty = 4, col = "red")
legend("topright",legend = c("Fitted jump-off", "Actual jump-off", 
       "Fitted jump-off, 30 year look-back"), 
       lty = 1:3, col = c("black", "blue", "red"))



