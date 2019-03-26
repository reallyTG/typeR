library(tseries)


### Name: pp.test
### Title: Phillips-Perron Unit Root Test
### Aliases: pp.test
### Keywords: ts

### ** Examples

x <- rnorm(1000)  # no unit-root
pp.test(x)

y <- cumsum(x)  # has unit root
pp.test(y)



