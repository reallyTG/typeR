## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(fda)
library(NITPicker)
 mat=CanadianWeather$monthlyTemp #load data - a matrix with 12 rows, representing months (time); and 35 columns, representing cities (experiments)
 a=findPathF1(c(1:12), mat, 4, numPerts=500) #find a set of points that help predict the shape of the curve
 print(a) #indices of months to select for follow-up experiments
 print(rownames(CanadianWeather$monthlyTemp)[a]) #month names selected

## ------------------------------------------------------------------------
library(fda)
library(NITPicker)
mat=CanadianWeather$monthlyTemp #load data - a matrix with 12 rows, representing months (time); and 35 columns, representing cities (experiments)
 y=CanadianWeather$monthlyTemp[,"Resolute"]
a=findPathF2(c(1:12), y, mat, 4, numPerts=500) #find a set of points that help predict the shape of the curve
print(a) #indices of months to select for follow-up experiments
print(rownames(CanadianWeather$monthlyTemp)[a])

## ------------------------------------------------------------------------
library(fda)
library(NITPicker)
#Set up data:
atlanticCities=which(CanadianWeather$region[as.character(colnames(CanadianWeather$monthlyTemp))]=="Atlantic")
 matAtlantic=CanadianWeather$monthlyTemp[, names(atlanticCities)]
 
 continentalCities=which(CanadianWeather$region[as.character(colnames(CanadianWeather$monthlyTemp))]=="Continental")
 matContinental=CanadianWeather$monthlyTemp[, names(continentalCities)]
 
 #find a set of points that helps capture the difference between Atlantic and Continental cities, normalised by the variance
 a=findPathF3(c(1:12),  matAtlantic,  matContinental, 4, numPerts=500) #find a set of points that help predict the shape of the curve
 print(a) #indices of months to select for follow-up experiments
 print(rownames(CanadianWeather$monthlyTemp)[a]) #month names selected

