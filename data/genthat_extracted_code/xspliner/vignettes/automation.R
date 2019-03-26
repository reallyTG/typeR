## ----message = FALSE-----------------------------------------------------
library(xspliner)
library(randomForest)

rf_iris <- randomForest(Petal.Width ~  Sepal.Length + Petal.Length + Species, data = iris)
model_xs <- xspline(Petal.Width ~ 
  Sepal.Length + 
  xs(Petal.Length, effect = list(grid.resolution = 100), transition = list(bs = "cr")) + 
  xf(Species, transition = list(stat = "loglikelihood", value = 4)),
  model = rf_iris)
summary(model_xs)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Petal.Width ~ 
  Sepal.Length + 
  xs(Petal.Length) + 
  xf(Species),
  model = rf_iris, 
  xs_opts = list(effect = list(grid.resolution = 100), transition = list(bs = "cr")),
  xf_opts = list(transition = list(stat = "loglikelihood", value = 4))
)
summary(model_xs)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Petal.Width ~ 
  xs(Sepal.Length, transition = list(k = 10)) + 
  xs(Petal.Length) + 
  xf(Species),
  model = rf_iris, 
  xs_opts = list(effect = list(grid.resolution = 100), transition = list(bs = "cr")),
  xf_opts = list(transition = list(stat = "loglikelihood", value = 4))
)
summary(model_xs)

## ------------------------------------------------------------------------
xs_opts_default
xf_opts_default

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Petal.Width ~ Sepal.Length  + Petal.Length + Species,
  model = rf_iris,
  consider = "all"
)
summary(model_xs)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Petal.Width ~ Sepal.Length  + Petal.Length + Species,
  model = rf_iris,
  data = iris,
  consider = "all"
)
summary(model_xs)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Petal.Width ~ Sepal.Length + Petal.Length + Species,
  model = rf_iris,
  data = iris,
  consider = "all",
  xf_opts = list(transition = list(alter = "never"))
)
summary(model_xs)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Petal.Width ~ Sepal.Length + Petal.Length + Species,
  model = rf_iris,
  data = iris,
  consider = "all",
  xs_opts = list(transition = list(alter = "never"))
)
summary(model_xs)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Petal.Width ~ ., model = rf_iris)
summary(model_xs)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(Petal.Width ~ ., 
                    model = rf_iris,
                    predictors = colnames(iris)[-c(2, 4)],
                    data = iris)
summary(model_xs)

## ----message = FALSE-----------------------------------------------------
model_xs <- xspline(rf_iris)
summary(model_xs)

## ----message = FALSE-----------------------------------------------------
library(pdp)
library(e1071)
data(boston)
svm_boston <- svm(chas ~ cmedv + rad + lstat, data = boston, probability = TRUE)
str(boston[, "rad"])
unique(boston$rad)

## ----error = TRUE--------------------------------------------------------
xs_model <- xspline(svm_boston)

## ------------------------------------------------------------------------
xs_model <- xspline(
  svm_boston,
  bare = "rad")
summary(xs_model)

## ----message = FALSE-----------------------------------------------------
library(DALEX)
rf_boston <- randomForest(lstat ~ cmedv + crim + chas, data = boston)
explainer <- explain(rf_boston, label = "boston")
model <- xspline(
  explainer
)
summary(model)

