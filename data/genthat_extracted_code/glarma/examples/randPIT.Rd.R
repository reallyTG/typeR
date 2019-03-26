library(glarma)


### Name: normRandPIT
### Title: Random normal probability integral transformation
### Aliases: normRandPIT
### Keywords: ts

### ** Examples

data(DriverDeaths)
y <- DriverDeaths[, "Deaths"]
X <- as.matrix(DriverDeaths[, 2:5])
Population <- DriverDeaths[, "Population"]

### Offset included
glarmamodOffset <- glarma(y, X, offset = log(Population/100000),
                          phiLags = c(12),
                          type = "Poi", method = "FS",
                          residuals = "Pearson", maxit = 100, grad = 1e-6)
rt <- normRandPIT(glarmamodOffset)$rt
par(mfrow = c(2,2))
hist(rt, main = "Histogram of Randomized Residuals",
     xlab = expression(r[t]))
box()
qqnorm(rt, main = "Q-Q Plot of  Randomized Residuals" )
abline(0, 1, lty = 2)
acf(rt, main = "ACF of Randomized Residuals")
pacf(rt, main = "PACF of Randomized Residuals")



