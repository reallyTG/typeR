library(timsac)


### Name: fpeaut
### Title: FPE Auto
### Aliases: fpeaut
### Keywords: ts

### ** Examples

y <- arima.sim(list(order=c(2,0,0), ar=c(0.64,-0.8)), n = 200)
fpeaut(y, max.order = 20)



