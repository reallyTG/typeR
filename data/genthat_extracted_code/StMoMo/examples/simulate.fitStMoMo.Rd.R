library(StMoMo)


### Name: simulate.fitStMoMo
### Title: Simulate future sample paths from a Stochastic Mortality Model
### Aliases: simulate.fitStMoMo

### ** Examples

#Lee-Carter
LCfit <- fit(lc(), data = EWMaleData, ages.fit = 55:89)
LCsim.mrwd <- simulate(LCfit, nsim = 100)
LCsim.iarima <- simulate(LCfit, nsim = 100, kt.method = "iarima", 
                         kt.order = c(1, 1, 2))

par(mfrow=c(2, 2))
plot(LCfit$years, LCfit$kt[1, ], xlim = range(LCfit$years, LCsim.mrwd$kt.s$years),
     ylim = range(LCfit$kt, LCsim.mrwd$kt.s$sim), type = "l", 
     xlab = "year", ylab = "kt", 
     main = "Lee-Carter: Simulated paths of the period index kt (mrwd)")
matlines(LCsim.mrwd$kt.s$years, LCsim.mrwd$kt.s$sim[1, , ], type = "l", lty = 1)

plot(LCfit$years, (LCfit$Dxt / LCfit$Ext)["65", ], 
     xlim = range(LCfit$years, LCsim.mrwd$years),
     ylim = range((LCfit$Dxt / LCfit$Ext)["65", ], LCsim.mrwd$rates["65", , ]), 
     type = "l", xlab = "year", ylab = "rate", 
     main = "Lee-Carter: Simulated mortality rates at age 65")
matlines(LCsim.mrwd$years, LCsim.mrwd$rates["65", , ], type = "l", lty = 1)

plot(LCfit$years, LCfit$kt[1, ], xlim = range(LCfit$years, LCsim.iarima$kt.s$years),
     ylim = range(LCfit$kt, LCsim.iarima$kt.s$sim), type = "l", 
     xlab = "year", ylab = "kt", 
     main = "Lee-Carter: Simulated paths of the period index kt (ARIMA(1, 1, 2))")
matlines(LCsim.iarima$kt.s$years, LCsim.iarima$kt.s$sim[1, , ], type = "l", lty = 1)

plot(LCfit$years, (LCfit$Dxt / LCfit$Ext)["65", ], 
     xlim = range(LCfit$years, LCsim.iarima$years),
     ylim = range((LCfit$Dxt / LCfit$Ext)["65", ], LCsim.iarima$rates["65", , ]), 
     type = "l", xlab = "year", ylab = "rate", 
     main = "Lee-Carter: Simulated mortality rates at age 65 (ARIMA(1, 1, 2))")
matlines(LCsim.iarima$years, LCsim.iarima$rates["65", , ], type = "l", lty = 1)

#APC
par(mfrow=c(1, 3))
wxt <- genWeightMat(55:89,  EWMaleData$years, clip = 3)
APCfit <- fit(apc(), data = EWMaleData, ages.fit = 55:89, wxt = wxt)
APCsim <- simulate(APCfit, nsim = 100, gc.order = c(1, 1, 0))

plot(APCfit$years, APCfit$kt[1, ], 
     xlim = range(APCfit$years, APCsim$kt.s$years),
     ylim = range(APCfit$kt, APCsim$kt.s$sim), type = "l",
     xlab = "year", ylab = "kt",
     main = "APC: Simulated paths of the period index kt")
matlines(APCsim$kt.s$years, APCsim$kt.s$sim[1, , ], type = "l", lty = 1)

plot(APCfit$cohorts, APCfit$gc, 
     xlim = range(APCfit$cohorts, APCsim$gc.s$cohorts),
     ylim = range(APCfit$gc, APCsim$gc.s$sim, na.rm = TRUE), type = "l",
     xlab = "year", ylab = "kt", 
     main = "APC: Simulated paths of the cohort index (ARIMA(1,1,0))")
matlines(APCsim$gc.s$cohorts, APCsim$gc.s$sim, type = "l", lty = 1)

plot(APCfit$years, (APCfit$Dxt / APCfit$Ext)["65", ], 
     xlim = range(APCfit$years, APCsim$years),
     ylim = range((APCfit$Dxt/APCfit$Ext)["65", ], APCsim$rates["65", , ]), 
     type = "l", xlab = "year", ylab = "rate", 
     main = "APC: Simulated of mortality rates at age 65")
matlines(APCsim$years, APCsim$rates["65", , ], type = "l", lty = 1)

#Compare LC and APC
library(fanplot)
par(mfrow=c(1, 1))
plot(LCfit$years, (LCfit$Dxt / LCfit$Ext)["65", ], 
     xlim = range(LCfit$years, LCsim.mrwd$years),
     ylim = range((LCfit$Dxt / LCfit$Ext)["65", ], LCsim.mrwd$rates["65", , ], 
     APCsim$rates["65", , ]), type = "l", xlab = "year", ylab = "rate", 
     main = "Fan chart of mortality rates at age 65 (LC vs. APC)")
fan(t(LCsim.mrwd$rates["65", , ]), start = LCsim.mrwd$years[1], 
    probs = c(2.5, 10, 25, 50, 75, 90, 97.5), n.fan = 4,
    fan.col = colorRampPalette(c(rgb(1, 0, 0), rgb(1, 1, 1))), ln = NULL)
fan(t(APCsim$rates["65", 1:(length(APCsim$years) - 3), ]), 
    start = APCsim$years[1], probs = c(2.5, 10, 25, 50, 75, 90, 97.5), 
    n.fan = 4, fan.col = colorRampPalette(c(rgb(0, 0, 1), rgb(1, 1, 1))), 
    ln = NULL) 



