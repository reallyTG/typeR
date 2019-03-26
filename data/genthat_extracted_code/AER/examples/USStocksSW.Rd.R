library(AER)


### Name: USStocksSW
### Title: Monthly US Stock Returns (1931-2002, Stock & Watson)
### Aliases: USStocksSW
### Keywords: datasets

### ** Examples

data("USStocksSW")
plot(USStocksSW)

## Stock and Watson, p. 540, Table 14.3
library("dynlm")
fm1 <- dynlm(returns ~ L(returns), data = USStocksSW, start = c(1960,1))
coeftest(fm1, vcov = sandwich)
fm2 <- dynlm(returns ~ L(returns, 1:2), data = USStocksSW, start = c(1960,1))
waldtest(fm2, vcov = sandwich)
fm3 <- dynlm(returns ~ L(returns, 1:4), data = USStocksSW, start = c(1960,1))
waldtest(fm3, vcov = sandwich)

## Stock and Watson, p. 574, Table 14.7
fm4 <- dynlm(returns ~ L(returns) + L(d(dividend)), data = USStocksSW, start = c(1960, 1))
fm5 <- dynlm(returns ~ L(returns, 1:2) + L(d(dividend), 1:2), data = USStocksSW, start = c(1960,1))
fm6 <- dynlm(returns ~ L(returns) + L(dividend), data = USStocksSW, start = c(1960,1))



