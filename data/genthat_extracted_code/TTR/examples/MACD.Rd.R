library(TTR)


### Name: MACD
### Title: MACD Oscillator
### Aliases: MACD
### Keywords: ts

### ** Examples


data(ttrc)

macd  <- MACD( ttrc[,"Close"], 12, 26, 9, maType="EMA" )
macd2 <- MACD( ttrc[,"Close"], 12, 26, 9,
         maType=list(list(SMA), list(EMA, wilder=TRUE), list(SMA)) )




