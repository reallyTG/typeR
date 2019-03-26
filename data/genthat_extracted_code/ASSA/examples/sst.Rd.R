library(ASSA)


### Name: sst
### Title: Singular Spectrum Trendline
### Aliases: sst sst.default
### Keywords: datasets

### ** Examples

## SIMULATED DATA EXAMPLES
## Example 1
N <- 500
t <- seq(.01, 5, length = N)
Y <- t^3 - 9 * t^2 + 23 * t + rnorm(N, 0, 1)
y <- mtsframe(date = t, Y)
fit <- sst(y)
plot(t, Y, col = "gray", ylab = "", 
     xlab = "time", pch = 16, ylim = c(-10, 31))
lines(t, t^3 - 9 * t^2 + 23 * t)
lines(t, fit$trendline$Y, col = "red")
## Example 2
N <- 500
t <- seq(.01, 5, length = N)
Y <- 10 * sin(3 * t) / t + rnorm(N, 0, 1)
y <- mtsframe(date = t, Y)
fit <- msst(y)
fit$selected.components
plot(t, Y, col = "gray", ylab = "",
     xlab = "time", pch = 16, ylim = c(-10, 31))
lines(t, 10 * sin(3 * t) / t, col = "black")
lines(t, fit$trendline$Y, col = "red")

## BREXIT DATA EXAMPLE
## Note: sst also can deal with several time series as input yet the
## most appropriate method for multivariate time series is msst
data(brexit)
attach(brexit)
y <- mtsframe(date, brexit[, 1:3] / 100)
fit <- sst(y)
plot(fit)

## Number of components automatically selected 
fit$selected.components 

## Chronological plot (de Carvalho and Martos, 2018; Fig. 1)
plot(fit, options = list(type = "trendlines"), xlab = "time",
     col = c("blue", "red", "black"), lwd = 2, lty = c(1, 2, 3))

## Plot elementary reconstructed components
## (de Carvalho and Martos, 2018; Fig. 3)
plot(fit, options = list(type = "components", serie = 1, ncomp = 1:2))
plot(fit, options = list(type = "components", serie = 2, ncomp = 1:2))
plot(fit, options = list(type = "components", serie = 3, ncomp = 1  ))

## Plot cumulative periodograms (with 95% confidence bands)
par(mfrow=c(1,3))
plot(fit, options = list(type = "cpgrams",
           series.names = c('Leave','Stay','Undecided')))

## Scree-plot (with 95% confidence bands)
par(mfrow = c(1, 3))
plot(fit, options = list(type = "screeplots", ncomp = 1:10,
          series.names = c('Leave','Stay','Undecided')),
            type = "b", pch = 20, lwd = 2)



