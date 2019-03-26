library(aTSA)


### Name: MA
### Title: Moving Average Filter
### Aliases: MA

### ** Examples

x <- arima.sim(list(order = c(1,0,0),ar = 0.4),n = 100)
y <- 5*(1:100)/100 + x
MA(y)

# moving average filter for co2 data
MA(co2)



