library(sarima)


### Name: prepareSimSarima
### Title: Prepare SARIMA simulations
### Aliases: prepareSimSarima print.simSarimaFun
### Keywords: simulation arima sarima

### ** Examples

mo1 <- list(ar=0.9, iorder = 1, siorder = 1, nseasons = 4, sigma2 = 2)
fs1 <- prepareSimSarima(mo1, x = list(before = rep(0,6)),  n = 100)
tmp1 <- fs1()
plot(ts(tmp1))

fs2 <- prepareSimSarima(mo1, x = list(before = rep(1,6)),  n = 100)
tmp2 <- fs2()
plot(ts(tmp2))

mo3 <- mo1
mo3[["ar"]] <- 0.5
fs3 <- prepareSimSarima(mo3, x = list(before = rep(0,6)),  n = 100)
tmp3 <- fs3()
plot(ts(tmp3))



