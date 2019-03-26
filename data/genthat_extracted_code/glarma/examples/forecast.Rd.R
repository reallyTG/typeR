library(glarma)


### Name: forecast
### Title: Forecasting GLARMA time series
### Aliases: forecast forecast.glarma
### Keywords: ts methods

### ** Examples

require(zoo)
### Model number of deaths
data(DriverDeaths)
y <- DriverDeaths[, "Deaths"]
X <- as.matrix(DriverDeaths[, 2:5])
Population <- DriverDeaths[, "Population"]

### Offset included
glarmamod <- glarma(y, X, offset = log(Population/100000),
                    phiLags = c(12),
                    thetaLags = c(1),
                    type = "Poi", method = "FS",
                    residuals = "Pearson", maxit = 100, grad = 1e-6)
print(summary(glarmamod))

XT1 <- matrix(X[72,], nrow = 1)
offsetT1 <- log(Population/100000)[72]

mu <- forecast(glarmamod, 1, XT1, offsetT1)$mu
print(mu)


### Save some values
allX <- X
allFits <- fitted(glarmamod)
ally <- y

### Look at a succession of forecasts
### Using actual values in forecasts
forecasts <- numeric(72)
for (i in (62:71)){
    y <- DriverDeaths[1:i, "Deaths"]
    X <- as.matrix(DriverDeaths[1:i, 2:5])
    Population <- DriverDeaths[1:i, "Population"]

    ## Offset included
    glarmamod <- glarma(y, X, offset = log(Population/100000),
                        phiLags = c(12),
                        thetaLags = c(1),
                        type = "Poi", method = "FS",
                        residuals = "Pearson", maxit = 100, grad = 1e-6)
    XT1 <- matrix(allX[i + 1, ], nrow = 1)
    offsetT1 <- log(DriverDeaths$Population[i + 1]/100000)
    mu <- forecast(glarmamod, 1, XT1, offsetT1)$mu
    if (i == 62){
        forecasts[1:62] <- fitted(glarmamod)
    }
    forecasts[i+1] <- mu
}
par(mfrow = c(1,1))
forecasts <- ts(forecasts[63:72], start = c(1985, 10), deltat = 1/12)
fitted <- ts(allFits, start = c(1980, 8), deltat = 1/12)
obs <- ts(DriverDeaths$Deaths, start = c(1980, 8), deltat = 1/12)
plot(obs, ylab = "Driver Deaths", lty = 2,
     main = "Single Vehicle Nighttime Driver Deaths in Utah")
points(obs)
lines(fitted, lwd = 2)
lines(forecasts, col = "red")
par(xpd = NA)
graph.param <-
    legend("top",
           legend = c("observations",expression(estimated~mu[t]),
                      expression(predicted~mu[t])),
           ncol = 3,
           cex = 0.7,
           bty = "n", plot = FALSE)
legend(graph.param$rect$left,
       graph.param$rect$top + graph.param$rect$h,
       legend = c("observations", expression(estimated~mu[t]),
                  expression(predicted~mu[t])),
       col = c("black","black","red"),
       lwd = c(1,2,1), lty = c(2,1,1),
       pch = c(1, NA_integer_, NA_integer_),
       ncol = 3,
       cex = 0.7,
       bty = "n",
       text.font = 4)
par(xpd = FALSE)

### Generate a sample of Y values 2 steps ahead and examine the distribution
data(DriverDeaths)
y <- DriverDeaths[, "Deaths"]
X <- as.matrix(DriverDeaths[, 2:5])
Population <- DriverDeaths[, "Population"]

### Fit the glarma model to the first 70 observations
glarmamod <- glarma(y[1:70], X[1:70, ],
                    offset = log(Population/100000)[1:70],
                    phiLags = c(12),
                    thetaLags = c(1),
                    type = "Poi", method = "FS",
                    residuals = "Pearson", maxit = 100, grad = 1e-6)

nObs <- NROW(X)
n.ahead <- 2
### Specify the X matrix and offset for the times where predictions
### are required
XT1 <- as.matrix(X[(nObs - n.ahead + 1):nObs, ])
offsetT1 <- log(Population/100000)[(nObs - n.ahead + 1):nObs]
nSims <- 500
forecastY <- matrix(ncol = n.ahead, nrow = nSims)
forecastMu <- matrix(ncol = n.ahead, nrow = nSims)

### Generate sample predicted values
for(i in 1:nSims){
    temp <-  forecast(glarmamod, n.ahead, XT1, offsetT1)
    forecastY[i, ] <- temp$Y
    forecastMu[i, ] <- temp$mu
}
### Examine distribution of sample of Y values n.ahead
table(forecastY[, 2])
par(mfrow = c(2,1))
barplot(table(forecastY[, 2]),
        main = "Barplot of Sample Y Values 2 Steps Ahead")
hist(forecastY[, 2], xlab = "Sample Y values",
     breaks=seq(0,max(forecastY[, 2])),
     main = "Histogram of Sample Y Values 2 Steps Ahead\nwith 0.025 and 0.975 Quantiles")
abline(v = quantile(forecastY[, 2], c(0.025, 0.975)), col = "red")




