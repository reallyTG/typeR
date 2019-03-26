library(drc)


### Name: getMeanFunctions
### Title: Display available dose-response models
### Aliases: getMeanFunctions
### Keywords: models nonlinear

### ** Examples


## Listing all functions
getMeanFunctions()

## Listing all functions with 4 parameters
getMeanFunctions(4)

## Listing all (log-)logistic functions
getMeanFunctions(fname = "L")

## Listing all three-parameter (log-)logistic or Weibull functions
getMeanFunctions(3, fname = c("LL", "W"))

## Listing all four-parameter (log-)logistic or Weibull functions
getMeanFunctions(4, fname = c("LL", "W"))




