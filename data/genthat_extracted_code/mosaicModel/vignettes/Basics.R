## ----setup, include = FALSE----------------------------------------------
library(ggformula)
library(MASS)
library(tidyverse)
library(mosaicModel)
library(randomForest)
library(caret)
library(splines)
theme_update(legend.position = "top")
knitr::opts_chunk$set(fig.align = "center", fig.show = "hold", out.width = "45%")

## ----fuel_intro, fig.cap = "A simple display of the `mtcars` data used in the example."----
mtcars <- mtcars %>% mutate(transmission = ifelse(am, "manual", "automatic"))
gf_point(mpg ~ hp, color = ~ transmission, data = mtcars)

## ------------------------------------------------------------------------
fuel_mod_1 <- lm(mpg ~ hp * transmission, data = mtcars)
fuel_mod_2 <- lm(mpg ~ ns(hp, 2) * transmission, data = mtcars)

## ----out.width = "30%"---------------------------------------------------
mod_plot(fuel_mod_1) 
mod_plot(fuel_mod_2) 

## ------------------------------------------------------------------------
theme_update(legend.position = "top")
gf_point(Sepal.Length ~ Petal.Length, color = ~ Species, data = iris) 

## ------------------------------------------------------------------------
library(randomForest)
iris_mod_1 <- randomForest(Species ~ Sepal.Length + Petal.Length, data = iris)
library(caret)
iris_mod_2 <- knn3(Species ~., data = iris, k = 15)

## ------------------------------------------------------------------------
mod_plot(iris_mod_1)

## ----out.width = "80%", fig.width = 8, fig.height = 8--------------------
mod_plot(iris_mod_2, class_level = "setosa")

## ----fig.out="40%", fig.keep = "hold"------------------------------------
mod_plot(iris_mod_2, ~ Petal.Length + Petal.Width)
mod_plot(iris_mod_2, ~ Petal.Length + Petal.Width + Sepal.Width)

## ------------------------------------------------------------------------
mod_eval(fuel_mod_1, transmission = "manual", hp = 200)

## ------------------------------------------------------------------------
mod_eval(fuel_mod_1)

## ------------------------------------------------------------------------
f1 <- mod_fun(fuel_mod_1)
f1(hp = 200:203, transmission = "manual")

## ------------------------------------------------------------------------
mod_eval(iris_mod_1, nlevels = 2)

## ------------------------------------------------------------------------
mod_effect(fuel_mod_2, ~ hp)

## ------------------------------------------------------------------------
mod_effect(fuel_mod_2, ~ hp, hp = c(100, 200), transmission = "manual")
mod_effect(fuel_mod_2, ~ hp, nlevels = 3)

## ------------------------------------------------------------------------
mod_effect(fuel_mod_2, ~ hp, step = 0.1, nlevels = 1)

## ------------------------------------------------------------------------
mod_effect(iris_mod_2, ~ Sepal.Length, step = 0.01, class_level = "virginica" )
mod_effect(iris_mod_2, ~ Sepal.Length, step = 1, class_level = "virginica")

## ------------------------------------------------------------------------
mod_error(fuel_mod_2)

## ------------------------------------------------------------------------
mod_error(fuel_mod_2, testdata = mtcars[1:10,])

## ------------------------------------------------------------------------
mod_error(iris_mod_2, error_type = "class_error")
mod_error(iris_mod_2, error_type = "LL")

## ------------------------------------------------------------------------
ensemble_fuel_1 <- mod_ensemble(fuel_mod_1, nreps = 10)
ensemble_iris_1 <- mod_ensemble(iris_mod_1, nreps = 10)

## ------------------------------------------------------------------------
mod_plot(ensemble_fuel_1)
mod_effect(ensemble_iris_1, ~ Petal.Length)
mod_eval(ensemble_iris_1, nlevels = 1)

## ------------------------------------------------------------------------
mod_effect(fuel_mod_2, ~ transmission, bootstrap = 10, hp = c(50,150,250))
mod_eval(fuel_mod_2, bootstrap = 50, hp = c(50,150))

## ------------------------------------------------------------------------
performance <- mod_cv(fuel_mod_1, fuel_mod_2, ntrials = 10)
performance
performance %>%
  gf_point(mse ~ model)

## ------------------------------------------------------------------------
methods(mod_eval_fun)

## ------------------------------------------------------------------------
library(MASS)
my_mod <- lda(Species ~ Petal.Length + Petal.Width, data = iris)

## ------------------------------------------------------------------------
formula_from_mod(my_mod)
data_from_mod(my_mod) %>% head(2)

## ----error = TRUE--------------------------------------------------------
construct_fitting_call(my_mod, data_name = "placeholder")

## ----eval=FALSE----------------------------------------------------------
#  mod_eval_fun(my_mod)

## ------------------------------------------------------------------------
methods(class = "lda")

## ------------------------------------------------------------------------
predict(my_mod) %>% str()

## ------------------------------------------------------------------------
mosaicModel:::mod_eval_fun.lda

## ----error = TRUE--------------------------------------------------------
mod_eval_fun(my_mod, data = iris[c(30, 80, 120),])

## ------------------------------------------------------------------------
mod_effect(my_mod, ~ Petal.Length, bootstrap = 10,  
           class_level = "virginica")

## ------------------------------------------------------------------------
mod_plot(my_mod, bootstrap = 10, class_level = "virginica")

