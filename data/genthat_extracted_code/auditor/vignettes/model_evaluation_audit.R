## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(warning = FALSE)
knitr::opts_chunk$set(message = FALSE)

## ------------------------------------------------------------------------
library(auditor)
library(mlbench)

## ------------------------------------------------------------------------
data(PimaIndiansDiabetes)
head(PimaIndiansDiabetes)

## ------------------------------------------------------------------------
pima <- PimaIndiansDiabetes
pima$diabetes <- ifelse(pima$diabetes == "pos", 1, 0)

## ------------------------------------------------------------------------
model_glm <- glm(diabetes~., data = pima, family = binomial)

library(e1071)
model_svm <- svm(diabetes~., data = pima)

## ------------------------------------------------------------------------
au_glm <- audit(model_glm, data = pima, y = pima$diabetes)
au_svm <- audit(model_svm, data = pima, y = pima$diabetes, label = "svm")

## ------------------------------------------------------------------------
plotROC(au_glm, au_svm)

## ------------------------------------------------------------------------
plotLIFT(au_glm, au_svm)

