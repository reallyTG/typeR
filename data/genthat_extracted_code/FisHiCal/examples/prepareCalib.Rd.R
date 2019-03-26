library(FisHiCal)


### Name: prepareCalib
### Title: Prepare Hi-C calibration
### Aliases: prepareCalib

### ** Examples
 
 data(match) 
 npoints = 10 # number of points to fit
 
 # prepareCalib computes threshold according to the fit 
 # useMax is set to FALSE
 res = prepareCalib(match, npoints, useMax = FALSE)
 calib = res$calib
 calib
 fit = res$fit
 alpha = calib$params[[1]]
 beta = calib$params[[2]]
 threshold = calib$params[[3]]
 
 # plot
 plot(match$frequencies ~ match$distances, xlab = "distances", 
 ylab = "frequencies")
 
 lines((exp(beta)*match$distances^alpha)~match$distances, 
 col = "red")
 
 plot(log(match$frequencies) ~ log(match$distances), 
 xlab = "log(distances)", ylab = "log(frequencies)")
 abline(fit, col = "red")
 
 # plot the estimated threshold 
 abline(h = beta + log(threshold)*alpha, lty = 3)
             



