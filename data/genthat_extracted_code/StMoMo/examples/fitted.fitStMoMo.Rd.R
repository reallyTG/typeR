library(StMoMo)


### Name: fitted.fitStMoMo
### Title: Compute fitted values for a Stochastic Mortality Model
### Aliases: fitted.fitStMoMo

### ** Examples

LCfit <- fit(lc(), data = EWMaleData, ages.fit = 55:89)
matplot(LCfit$ages, fitted(LCfit), type = "l", lty = 1, 
        col = rainbow(length(LCfit$years)), xlab = "year", 
        ylab = "log death rate", main = "Fitted rates")

uxthat <- fitted(LCfit, type = "rates")
uxt <- LCfit$Dxt / LCfit$Ext
plot(LCfit$years, uxt["65", ], xlab = "year", ylab = "death rate",
     main = "fitted vs. observed rates at age 65")
lines(LCfit$years, uxthat["65", ])



