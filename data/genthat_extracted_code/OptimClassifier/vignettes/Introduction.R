## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(OptimClassifier)
library(ggplot2)

## ----Paso 1 Example 1 Credit Scoring-------------------------------------
## Load a Dataset
data(AustralianCredit)

## ----Paso 2 Example 1 Credit Scoring-------------------------------------
## Create the model
creditscoring <- Optim.GLM(Y~., AustralianCredit, p = 0.7, seed=2018)

## ----Paso 3 Example 1 Credit Scoring-------------------------------------

### See a ranking of the models tested
print(creditscoring)

## ----Paso 4 Example 1 Credit Scoring, fig.width=9------------------------

### Are you bored of R outputs?? Try to plot
plot(creditscoring)

## ----Paso 5 Example 1 Credit Scoring-------------------------------------
### Access to summary of the best model
summary(creditscoring)
### Access to summary of the secondth model
summary(creditscoring,2)

