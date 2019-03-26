## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# Start up cNORM
library(cNORM)
# Determine percentiles by group
normData <- rankByGroup(elfe, group = "group") 

## ------------------------------------------------------------------------
# Calculation of powers and interactions up to k = 4
normData <- computePowers(normData, k = 4, norm = "normValue", age = "group") 

## ------------------------------------------------------------------------
model <- bestModel(normData)

## ------------------------------------------------------------------------
printSubset(model)

## ----fig1, fig.height = 4, fig.width = 7---------------------------------

plotSubset(model, type = 0) 

## ----fig2, fig.height = 4, fig.width = 7---------------------------------
plotSubset(model, type = 1) 

## ----fig3, fig.height = 4, fig.width = 7---------------------------------
# Plots the fitted and the manifest percentiles

plot <- plotPercentiles(normData, model)


## ----fig4, fig.height = 4, fig.width = 7---------------------------------
plotRaw(normData, model, group="group")

## ----fig5, fig.height = 4, fig.width = 7---------------------------------
plotDerivative(model, minAge=1, maxAge=6, minNorm=20, maxNorm=80)

## ----fig6, fig.height = 4, fig.width = 7---------------------------------
plotNormCurves(model, normList = c(30, 40, 50, 60, 70), minAge = 2, maxAge = 5, step = 0.1, minRaw = 0, maxRaw = 28)

## ------------------------------------------------------------------------
predictNorm(15, 4.7, model, minNorm = 25, maxNorm = 75)

## ------------------------------------------------------------------------
predictRaw(55, 4.5, model$coefficients, minRaw = 0, maxRaw = 28)

