## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(error = TRUE)

## ---- fig.width = 7, fig.height = 5--------------------------------------
library(mmpf)
library(randomForest)
library(ggplot2)
library(reshape2)

data(swiss)

fit = randomForest(Fertility ~ ., swiss)
mp = marginalPrediction(swiss[, -1], "Education", c(10, nrow(swiss)), fit)
mp

ggplot(data.frame(mp), aes(Education, preds)) + geom_point() + geom_line()

## ---- fig.width = 7, fig.height = 5--------------------------------------
mp = marginalPrediction(swiss[, -1], "Education", c(10, 5), fit, aggregate.fun = identity)
mp

ggplot(melt(data.frame(mp), id.vars = "Education"), aes(Education, value, group = variable)) + geom_point() + geom_line()

## ---- fig.width = 7, fig.height = 5--------------------------------------
data(iris)

fit = randomForest(Species ~ ., iris)
mp = marginalPrediction(iris[, -ncol(iris)], "Petal.Width", c(10, 25), fit,
  predict.fun = function(object, newdata) predict(object, newdata = newdata, type = "prob"))
mp

plt = melt(data.frame(mp), id.vars = "Petal.Width", variable.name = "class",
  value.name = "prob")

ggplot(plt, aes(Petal.Width, prob, color = class)) + geom_line() + geom_point()

## ---- fig.width = 7, fig.height = 5--------------------------------------
mp = marginalPrediction(iris[, -ncol(iris)], c("Petal.Width", "Petal.Length"), c(10, 25), fit,
  predict.fun = function(object, newdata) predict(object, newdata = newdata, type = "prob"))
mp

plt = melt(data.frame(mp), id.vars = c("Petal.Width", "Petal.Length"),
  variable.name = "class", value.name = "prob")

ggplot(plt, aes(Petal.Width, Petal.Length, fill = prob)) + geom_raster() + facet_wrap(~ class)

## ------------------------------------------------------------------------
permutationImportance(iris, "Sepal.Width", "Species", fit)

## ------------------------------------------------------------------------
permutationImportance(iris, "Sepal.Width", "Species", fit,
  loss.fun = function(x, y) {
    mat = table(x, y)
    n = colSums(mat)
    diag(mat) = 0
    rowSums(mat) / n
  },
  contrast.fun = function(x, y) x - y)

