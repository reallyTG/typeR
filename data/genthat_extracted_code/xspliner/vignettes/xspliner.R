## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  collapse = TRUE,
  comment = "#>"
)
library(randomForest)
library(pdp)
library(xspliner)

## ----include = FALSE, message = FALSE------------------------------------
library(ggplot2)
data(boston)
set.seed(123)

# build random forest model:
boston.rf <- randomForest(cmedv ~ lstat + ptratio + age, data = boston)

# build xspline model with specified response method and approximation options
model_pdp <- xspline(
  cmedv ~
    xs(lstat, transition = list(k = 10), effect = list(type = "pdp", grid.resolution = 60)) +
    xs(ptratio, transition = list(k = 10), effect = list(type = "pdp", grid.resolution = 60)) +
    age,
  model = boston.rf
)

model_ale <- xspline(
  cmedv ~
    xs(lstat, transition = list(k = 10), effect = list(type = "ale", K = 60)) +
    xs(ptratio, transition = list(k = 10), effect = list(type = "ale", K = 60)) +
    age,
  model = boston.rf
)

## ----fig.width=3, fig.height=3, echo = FALSE, fig.show='hold'------------
plot(model_pdp, "ptratio", plot_approx = FALSE, plot_deriv = FALSE) + guides(colour = FALSE) + labs(title = "Partial Dependence Plot")
plot(model_ale, "ptratio", plot_approx = FALSE, plot_deriv = FALSE) + guides(colour = FALSE) + labs(title = "Accumulated Local Effects Plot")

## ----fig.width=3, fig.height=3, echo = FALSE, fig.show='hold'------------
plot(model_pdp, "ptratio", plot_deriv = FALSE) + guides(colour = FALSE) + labs(title = "Partial Dependence Plot")
plot(model_ale, "ptratio", plot_deriv = FALSE) + guides(colour = FALSE) + labs(title = "Accumulated Local Effects Plot")

## ------------------------------------------------------------------------
data(boston)
str(boston)

## ------------------------------------------------------------------------
boston_rf <- randomForest(cmedv ~ rm + lstat + nox, data = boston)

## ------------------------------------------------------------------------
rf_effect <- pdp::partial(boston_rf, "nox", grid.resolution = 40)
head(rf_effect)
nrow(rf_effect)

## ----message = FALSE-----------------------------------------------------
xp_model <- xspline(
  cmedv ~ rm + lstat +
    xs(nox, 
       effect = list(type = "pdp", grid.resolution = 40), 
       transition = list(k = 10, bs = "cr")),
  model = boston_rf
)

## ------------------------------------------------------------------------
summary(xp_model)

## ------------------------------------------------------------------------
plot(xp_model, "nox")

