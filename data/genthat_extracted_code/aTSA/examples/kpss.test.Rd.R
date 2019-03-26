library(aTSA)


### Name: kpss.test
### Title: Kwiatkowski-Phillips-Schmidt-Shin Test
### Aliases: kpss.test

### ** Examples

# KPSS test for AR(1) process
x <- arima.sim(list(order = c(1,0,0),ar = 0.2),n = 100)
kpss.test(x)

# KPSS test for co2 data
kpss.test(co2)



