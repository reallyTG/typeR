library(FisHiCal)


### Name: updateCalib
### Title: Update a parameter value in the calibration model
### Aliases: updateCalib

### ** Examples
 
 data(match) 
 npoints = 10 # number of points to fit
 
 # prepareCalib computes threshold according to the fit 
 # useMax is set to FALSE
 res = prepareCalib(match, npoints, useMax = FALSE)
 calib = res$calib
 calib
 calib = updateCalib(calib, 3.9, 3)
 calib
             



