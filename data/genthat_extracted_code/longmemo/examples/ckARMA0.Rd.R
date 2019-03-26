library(longmemo)


### Name: ckARMA0
### Title: Covariances of a Fractional ARIMA(0,d,0) Process
### Aliases: ckARMA0
### Keywords: ts

### ** Examples

str(C.8 <- ckARMA0(50, H = 0.8))
yl <- c(0,max(C.8))
plot(0:49, C.8, type = "h", ylim = yl)
plot(0:49, C.8, type = "h", log = "xy",
     main = "Log-Log  ACF for ARIMA(0,d,0)")



