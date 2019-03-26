library(pear)


### Name: pepsi
### Title: moving average expansion of a periodic autoregression
### Aliases: pepsi
### Keywords: ts

### ** Examples

data(Fraser)
pear.out <- pear(log(Fraser), ic="bic")
pepsi(pear.out$phi,lag.max=20)



