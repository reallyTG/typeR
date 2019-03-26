library(pco)


### Name: pco-package
### Title: Panel Cointegration Tests
### Aliases: pco-package pco
### Keywords: package

### ** Examples

data(gdi)
data(gds)
pedroni99(gdi, gds)

xx<-array(cumsum(rnorm(10000)),dim=c(100,20,5))
pedroni99m(xx)



