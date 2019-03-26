## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(fig.path = "figures/vignette-", fig.width = 5, message = FALSE)
library(cointmonitoR)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("cointReg")
#  devtools::install_github("aschersleben/cointmonitoR", build_vignettes = TRUE)
#  library("cointmonitoR")

## ------------------------------------------------------------------------
set.seed(1909)
x1 <- rnorm(200)

## ------------------------------------------------------------------------
test1 <- monitorStationarity(x1, m = 0.25)

## ------------------------------------------------------------------------
print(test1)

## ------------------------------------------------------------------------
plot(test1, what = "test")

## ------------------------------------------------------------------------
x2 <- c(x1[1:100], cumsum(x1[101:200]) / 2)
test2 <- monitorStationarity(x2, m = 93)
print(test2)

## ---- fig.height = 6-----------------------------------------------------
oldpar <- par(mfrow = c(2, 1))
plot(test2, what = "both", legend = FALSE)
par(oldpar)

## ------------------------------------------------------------------------
set.seed(1909)
x1 <- cumsum(rnorm(100, mean = 0.05, sd = 0.1))
x2 <- cumsum(rnorm(100, sd = 0.1)) + 1
x3 <- cumsum(rnorm(100, sd = 0.2)) + 2
x <- cbind(x1, x2, x3)
y <- 1 + x1 + x2 + x3 + rnorm(100, sd = 0.2)
matplot(1:100, cbind(y, x), type = "l", main = "Cointegration Model",
        xlab = "Observation Number", ylab = "")

## ------------------------------------------------------------------------
m <- 40
cointRegFM(x[1:m, ], y[1:m], deter = cbind(level = 1, trend = 1:m))

## ------------------------------------------------------------------------
test3 <- monitorCointegration(x = x, y = y, m = m, model = "FM", trend = FALSE)
print(test3)

## ---- fig.height = 6-----------------------------------------------------
oldpar <- par(mfrow = c(2, 1))
plot(test3, what = "both", legend = FALSE)
par(oldpar)

## ------------------------------------------------------------------------
y2 <- y + c(rep(0, 60), cumsum(rnorm(40, sd = 0.5)))
matplot(1:100, cbind(y2, x), type = "l", main = "Cointegration Model",
        xlab = "Observation Number", ylab = "")
abline(v = 60.5, col = 2)

## ------------------------------------------------------------------------
test4 <- monitorCointegration(x = x, y = y2, m = m, model = "FM", trend = FALSE)
print(test4)

## ---- fig.height = 6-----------------------------------------------------
oldpar <- par(mfrow = c(2, 1))
plot(test4, what = "both", legend = FALSE)
par(oldpar)

## ---- fig.height = 3-----------------------------------------------------
plot(test4, what = "test", legend = FALSE, log = "y")

