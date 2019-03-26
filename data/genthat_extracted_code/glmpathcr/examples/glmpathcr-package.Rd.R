library(glmpathcr)


### Name: glmpathcr-package
### Title: Fit a Penalized Continuation Ratio Model for Predicting an
###   Ordinal Response: Penalized L1 continuation Ratio Models for Ordinal
###   Response Prediction in High-dimensional Data Settings
### Aliases: glmpathcr-package
### Keywords: package models classif

### ** Examples

   data(diabetes)
   x <- diabetes[, 2:dim(diabetes)[2]]
   y <- diabetes$y
   fit <- glmpathcr(x, y)



