library(bcpa)


### Name: GetBestBreak
### Title: Find most likely change point in irregular time series
### Aliases: GetBestBreak

### ** Examples

# An example with a single break:
x <- c(arima.sim(list(ar = 0.9), 20) + 10, arima.sim(list(ar = 0.1), 20))
t <- 1:length(x)
plot(t,x, type="l")
(bb <- GetBestBreak(x,t, tau=FALSE))
abline(v = bb[2], col=2)



