## ----libs, echo = FALSE, warning = FALSE, message = FALSE----------------
library(mlr)
library(live)
library(dplyr)
library(ggplot2)
library(e1071)

## ----case5, warning = FALSE, message = FALSE-----------------------------
wine[5, ]

## ----sample, warning = FALSE, message = FALSE----------------------------
wine_svm <- e1071::svm(quality ~., data = wine)

similar <- sample_locally(data = wine,
                          explained_instance = wine[5, ],
                          explained_var = "quality",
                          size = 500)

## ----add, warning = FALSE, message = FALSE-------------------------------
similar1 <- add_predictions(to_explain = similar,
                            black_box_model = wine_svm)

## ----explanation, warning = FALSE, message = FALSE-----------------------
wine_expl <- fit_explanation(live_object = similar1,
                             white_box = "regr.lm")

## ----forestplot, warning = FALSE, message = FALSE, fig.width = 7---------
plot(wine_expl, type = "forest")

## ----waterfallplot, warning = FALSE, message = FALSE, fig.width = 7------
plot(wine_expl, type = "waterfall")

