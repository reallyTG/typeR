library(aTSA)


### Name: arch.test
### Title: ARCH Engle's Test for Residual Heteroscedasticity
### Aliases: arch.test

### ** Examples

x <- rnorm(100)
mod <- estimate(x,p = 1) # or mod <- arima(x,order = c(1,0,0))
arch.test(mod)



