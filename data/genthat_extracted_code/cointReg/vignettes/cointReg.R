## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(fig.path = "figures/vignette-", fig.width = 5,
                      message = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("cointReg")

## ---- eval = FALSE-------------------------------------------------------
#  devtools::install_github("aschersleben/cointReg", build_vignettes = TRUE)

## ------------------------------------------------------------------------
library("cointReg")

## ------------------------------------------------------------------------
set.seed(42)
x <- cumsum(rnorm(200, mean = 0, sd = 0.1)) + 10
y <- x + rnorm(200, sd = 0.4) + 2
matplot(1:200, cbind(y, x), type = "l", main = "Cointegration Model")

## ------------------------------------------------------------------------
deter <- rep(1, 200)
test <- cointRegFM(x = x, y = y, deter = deter)

## ------------------------------------------------------------------------
print(test)

## ------------------------------------------------------------------------
plot(test, main = "Residuals of the Cointegration Model")

## ------------------------------------------------------------------------
set.seed(1909)
x1 <- cumsum(rnorm(100, mean = 0.05, sd = 0.1))
x2 <- cumsum(rnorm(100, sd = 0.1)) + 1
x3 <- cumsum(rnorm(100, sd = 0.2)) + 2
x <- cbind(x1, x2, x3)
y <- x1 + x2 + x3 + rnorm(100, sd = 0.2) + 1
matplot(1:100, cbind(y, x), type = "l", main = "Cointegration Model")

## ------------------------------------------------------------------------
deter <- cbind(level = 1, trend = 1:100)
test <- cointRegFM(x, y, deter, kernel = "ba", bandwidth = "and")
print(test)

## ------------------------------------------------------------------------
plot(test, main = "Residuals of the Cointegration Model")

## ------------------------------------------------------------------------
set.seed(26)
x <- cumsum(rnorm(200))
y <- cumsum(rnorm(200))
summary(lm(y ~ x))

## ------------------------------------------------------------------------
cointRegFM(x = x, y = y, deter = rep(1, 200))

