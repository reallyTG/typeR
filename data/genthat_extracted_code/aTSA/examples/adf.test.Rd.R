library(aTSA)


### Name: adf.test
### Title: Augmented Dickey-Fuller Test
### Aliases: adf.test

### ** Examples

# ADF test for AR(1) process
x <- arima.sim(list(order = c(1,0,0),ar = 0.2),n = 100)
adf.test(x)
# ADF test for co2 data
adf.test(co2)



