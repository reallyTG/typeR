## ----message = FALSE, warning = FALSE------------------------------------
library(randomForest)
library(pdp)
library(xspliner)
data(boston)
set.seed(123)
boston_rf <- randomForest(cmedv ~ lstat + ptratio + age, data = boston)
model_xs <- xspline(
  cmedv ~
    xs(lstat, transition = list(k = 6), effect = list(type = "pdp", grid.resolution = 100)) +
    xs(ptratio, transition = list(k = 5), effect = list(type = "pdp", grid.resolution = 100)) +
    age,
  model = boston_rf,
  xs_opts = list(transition = list(monotonic = "auto"))
)

plot(model_xs, "ptratio", plot_deriv = TRUE)
plot(model_xs, "lstat", plot_deriv = TRUE)

## ----message = FALSE-----------------------------------------------------
set.seed(123)
boston_rf <- randomForest(cmedv ~ lstat + ptratio + age, data = boston)
model_pdp_auto <- xspline(
  cmedv ~
    xs(lstat, transition = list(k = 6), effect = list(type = "pdp", grid.resolution = 60)) +
    xs(ptratio, transition = list(k = 4), effect = list(type = "pdp", grid.resolution = 40)) +
    age,
  model = boston_rf,
  xs_opts = list(transition = list(alter = "auto"))
)

# aic statistic is used by default

summary(model_pdp_auto)

## ----message = FALSE-----------------------------------------------------
library(xspliner)
library(randomForest)
x <- rnorm(100)
z <- rnorm(100)
y <- rpois(100, exp(1 + x + z))
data <- data.frame(x, y, z)
model_rf <- randomForest(y ~ x + z, data = data)
model_xs_1 <- xspline(model_rf)
model_xs_2 <- xspline(model_rf, family = poisson(), link = "log")

## ------------------------------------------------------------------------
model_xs_1$aic
model_xs_2$aic

## ----message = FALSE-----------------------------------------------------
set.seed(123)
x <- rnorm(100, 10)
z <- rnorm(100, 10)
y <- x * z * rnorm(100, 1, 0.1)
data <- data.frame(x, z, y)
model_rf <- randomForest(log(y) ~ x + z, data = data)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(model_rf)
summary(model_xs)
plot(model_xs, model = model_rf, data = data)

## ----message = FALSE-----------------------------------------------------
x <- rnorm(100)
z <- rnorm(100)
y <- x + x * z + z + rnorm(100, 0, 0.1)
data <- data.frame(x, y, z)
model_rf <- randomForest(y ~ x + z, data = data)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(y ~ x * z, model = model_rf)
summary(model_xs)
plot(model_xs, model = model_rf, data = data)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(model_rf, form = "multiplicative")
summary(model_xs)
plot(model_xs, model = model_rf, data = data)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(y ~ ., model = model_rf, form = "multiplicative")
summary(model_xs)
plot(model_xs, model = model_rf, data = data)

## ----message = FALSE-----------------------------------------------------
library(randomForest)
library(xspliner)
data(airquality)
air <- na.omit(airquality)
model_rf <- randomForest(Ozone ~ ., data = air)
varImpPlot(model_rf)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Ozone ~ xs(Wind) + xs(Temp), model = model_rf)
summary(model_xs)
plot(model_xs, model = model_rf, data = air)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Ozone ~ xs(Wind) * xs(Temp), model = model_rf)
summary(model_xs)
plot(model_xs, model = model_rf, data = air)

