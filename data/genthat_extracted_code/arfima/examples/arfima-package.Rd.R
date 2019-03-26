library(arfima)


### Name: arfima-package
### Title: Simulates, fits, and predicts persistent and anti-persistent
###   time series. arfima
### Aliases: arfima-package
### Keywords: package

### ** Examples


## No test: 
set.seed(8564)
sim <- arfima.sim(1000, model = list(phi = c(0.2, 0.1), dfrac = 0.4, theta = 0.9))
fit <- arfima(sim, order = c(2, 0, 1), back=TRUE)

fit

data(tmpyr)

fit1 <- arfima(tmpyr, order = c(1, 0, 1), numeach = c(3, 3), dmean = FALSE)
fit1

plot(tacvf(fit1), maxlag = 30, tacf = TRUE)

fit2 <- arfima(tmpyr, order = c(1, 0, 0), numeach = c(3, 3), autoweed = FALSE,
dmean = FALSE)

fit2

fit2 <- weed(fit2)

fit2

tacfplot(fits = list(fit1, fit2))

fit3 <- removeMode(fit2, 2)

fit3

coef(fit2)
vcov(fit2)

fit1fgn <- arfima(tmpyr, order = c(1, 0, 1), numeach = c(3, 3),
dmean = FALSE, lmodel = "g")
fit1fgn

fit1hd <- arfima(tmpyr, order = c(1, 0, 1), numeach = c(3, 3),
dmean = FALSE, lmodel = "h")
fit1hd

data(SeriesJ)
attach(SeriesJ)

fitTF <- arfima(YJ, order= c(2, 0, 0), xreg = XJ, reglist =
list(regpar = c(1, 2, 3)), lmodel = "n", dmean = FALSE)
fitTF

detach(SeriesJ)

set.seed(4567)

sim <- arfima.sim(1000, model = list(phi = 0.3, dfrac = 0.4, dint = 1),
sigma2 = 9)

X <- matrix(rnorm(2000), ncol = 2)

simreg <- sim + crossprod(t(X), c(2, 3))

fitreg <- arfima(simreg, order = c(1, 1, 0), xreg = X)

fitreg

plot(sim)

lines(residuals(fitreg, reg = TRUE)[[1]], col = "blue")
##pretty much a perfect match.
## End(No test)




