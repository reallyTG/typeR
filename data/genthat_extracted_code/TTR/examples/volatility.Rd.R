library(TTR)


### Name: volatility
### Title: Volatility
### Aliases: volatility garman.klass parkinson rogers.satchell gk.yz
###   yang.zhang
### Keywords: ts

### ** Examples


data(ttrc)
ohlc <- ttrc[,c("Open","High","Low","Close")]
vClose <- volatility(ohlc, calc="close")
vClose0 <- volatility(ohlc, calc="close", mean0=TRUE)
vGK <- volatility(ohlc, calc="garman")
vParkinson <- volatility(ohlc, calc="parkinson")
vRS <- volatility(ohlc, calc="rogers")




