library(aTSA)


### Name: pp.test
### Title: Phillips-Perron Test
### Aliases: pp.test

### ** Examples

# PP test for ar(1) process
x <- arima.sim(list(order = c(1,0,0),ar = 0.2),n = 100)
pp.test(x)

# PP test for co2 data
pp.test(co2)



