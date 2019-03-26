library(TTR)


### Name: RSI
### Title: Relative Strength Index
### Aliases: RSI
### Keywords: ts

### ** Examples


data(ttrc)
price <- ttrc[,"Close"]

# Default case
rsi <- RSI(price)

# Case of one 'maType' for both MAs
rsiMA1 <- RSI(price, n=14, maType="WMA", wts=ttrc[,"Volume"])

# Case of two different 'maType's for both MAs
rsiMA2 <- RSI(price, n=14, maType=list(maUp=list(EMA,ratio=1/5),
             maDown=list(WMA,wts=1:10)))





