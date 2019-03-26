## ---- echo = FALSE, results = "hide",message=FALSE,warning=FALSE---------
library(C50)
library(knitr)
opts_chunk$set(comment = NA, digits = 3, prompt = TRUE, tidy = FALSE)

## ------------------------------------------------------------------------
library(C50)
mod <- C5.0(Species ~ ., data = iris)
summary(mod)

## ------------------------------------------------------------------------
predict(mod, iris[130,], type = "prob")

