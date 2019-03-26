library(forecast)


### Name: accuracy
### Title: Accuracy measures for a forecast model
### Aliases: accuracy accuracy.default
### Keywords: ts

### ** Examples


fit1 <- rwf(EuStockMarkets[1:200,1],h=100)
fit2 <- meanf(EuStockMarkets[1:200,1],h=100)
accuracy(fit1)
accuracy(fit2)
accuracy(fit1,EuStockMarkets[201:300,1])
accuracy(fit2,EuStockMarkets[201:300,1])
plot(fit1)
lines(EuStockMarkets[1:300,1])



