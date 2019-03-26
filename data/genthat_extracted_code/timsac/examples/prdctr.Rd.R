library(timsac)


### Name: prdctr
### Title: Prediction Program
### Aliases: prdctr print.prdctr
### Keywords: ts

### ** Examples

# "arima.sim" is a function in "stats".
# Note that the sign of MA coefficient is opposite from that in "timsac".
y <- arima.sim(list(order=c(2,0,1), ar=c(0.64,-0.8), ma=c(-0.5)), n = 1000)
y1 <- y[1:900]
z <- autoarmafit(y1)
ar <- z$model[[1]]$arcoef
ma <- z$model[[1]]$macoef
var <- z$model[[1]]$v
y2 <- y[901:990]
prdctr(y2, r = 50, s = 90, h = 10, arcoef = ar, macoef = ma, v = var)



