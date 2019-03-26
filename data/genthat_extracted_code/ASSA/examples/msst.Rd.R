library(ASSA)


### Name: msst
### Title: Multivariate Singular Spectrum Trendlines
### Aliases: msst msst.default
### Keywords: datasets

### ** Examples

## SIMULATED DATA EXAMPLE
N <- 500
t <- seq(.01, 5, length = N)
Y <- cbind(t^3 - 9 * t^2 + 23 * t + rnorm(N, 0, 1), 
           10 * sin(3 * t) / t + rnorm(N, 0, 1))
y <- mtsframe(date = t, Y)
fit <- msst(y)
matplot(t, Y, col = "gray", ylim = c(-10, 31), 
        xlab = "time", pch = 16)
lines(t, t^3 - 9 * t^2 + 23 * t)
lines(t, fit$trendline$Y[,1], col = "red")
lines(t, 10 * sin(3 * t) / t, col = "black")
lines(t, fit$trendline$Y[,2], col = "red")

## BREXIT DATA EXAMPLE
## (de Carvalho and Martos, 2018; Fig. 1)
data(brexit)
attach(brexit)
y <- mtsframe(date, brexit[, 1:3] / 100)
fit <- msst(y)

## Window length and number of components automatically selected on
## each dimension:
fit$l
fit$selected.components 

## Plot trendlines (de Carvalho and Martos, 2018; Fig. 1)
plot(fit, options = list(type = "trendlines"), xlab="time",
     col=c("blue", "red", "black"), lwd = 2, lty = c(1, 2, 3))

## Plot elementary reconstructed components 
## (de Carvalho and Martos, 2018; Fig. 5)
plot(fit, options = list(type = "components", ncomp = 1:3))

## Plot cumulative periodograms (with 95% confidence bands)
par(mfrow = c(1, 3))
plot(fit, options = list(type = "cpgrams",
          series.names = c('Leave','Stay','Undecided')) )

## Scree-plot (with 95% confidence bands)
par(mfrow = c(1, 1))
plot(fit, options = list(type = "screeplots", ncomp = 1:10),
     type = "b", pch = 20, lwd = 2, main='Scree plot')



