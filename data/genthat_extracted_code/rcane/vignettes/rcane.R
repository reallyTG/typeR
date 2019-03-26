## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----include, message=FALSE, warning=FALSE-------------------------------
library(rcane)

## ----bgd, message=FALSE, warning=FALSE-----------------------------------
rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd")

## ----bgdBoldDriver, message=FALSE, warning=FALSE-------------------------
rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd", boldDriver = TRUE)

## ----sgd, message=FALSE, warning=FALSE-----------------------------------
rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "sgd")

## ----sgdAda, message=FALSE, warning=FALSE--------------------------------
rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "sgd", AdaGrad = TRUE)

## ----mbgd, message=FALSE, warning=FALSE----------------------------------
rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "mini-bgd")

## ----cd, message=FALSE, warning=FALSE------------------------------------
rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "cd")

## ----coef, message=FALSE, warning=FALSE----------------------------------
bgd <- rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd")
coef(bgd)

## ----fitted, message=FALSE, warning=FALSE--------------------------------
bgd <- rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd")
head(fitted(bgd))

## ----formula, message=FALSE, warning=FALSE-------------------------------
bgd <- rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd")
formula(bgd)

## ----print, message=FALSE, warning=FALSE---------------------------------
bgd <- rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd")
print(bgd)

## ----resid, message=FALSE, warning=FALSE---------------------------------
bgd <- rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd")
head(resid(bgd))

## ----predict, message=FALSE, warning=FALSE-------------------------------
bgd <- rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd")
head(predict(bgd, newdata=iris))

## ----lr, message=FALSE, warning=FALSE------------------------------------
rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd", alpha=0.2)

## ----maxiterations, message=FALSE, warning=FALSE-------------------------
rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd", alpha=0.2, max.iter = 500)

## ----precision, message=FALSE, warning=FALSE-----------------------------
rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd", precision = 0.0002)

## ----plotLoss, message=FALSE, warning=FALSE------------------------------
bgd <- rlm(formula = Petal.Length ~ Petal.Width, data = iris, method = "bgd")
plotLoss(bgd)

