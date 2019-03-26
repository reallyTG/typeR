## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(dplyr)
library(ForecastFramework)
library(DAAG)

## ------------------------------------------------------------------------
data("Orange")
listFormData = ObservationList$new(
  data=Orange
)

## ------------------------------------------------------------------------
library(DAAG)
data("bomregions")
matrix_data = t(bomregions[1:8,c(10:17)])
matrixFormData = IncidenceMatrix$new(
  data=matrix_data,
  colData = list(
    yr=bomregions[1:8,1]
  )
)

## ----Comparison, warning = FALSE,message = FALSE-------------------------
listFormData$formArray(
  row='Tree',
  col='age',
  val='circumference'
)
listFormData$mat
matrixFormData$mat

## ------------------------------------------------------------------------
model = MoveAheadModel$new()
model$fit(listFormData)
model$fit(matrixFormData)
model$predict(matrixFormData)$mean()$mat
model$predict(listFormData)$mean()$mat

## ----Class Changing------------------------------------------------------
anotherMatrixFormData = IncidenceMatrix$new(listFormData)
anotherMatrixFormData$mat
listFormData$mat

