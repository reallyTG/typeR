library(FisHiCal)


### Name: calibrate
### Title: Hi-C calibration
### Aliases: calibrate

### ** Examples

 data(match) 
 data(hic)
 npoints = 10 # number of points to fit
 
 # prepareCalib computes threshold to fit 
 res = prepareCalib(match, npoints, useMax = FALSE)
 calib = res$calib
 calib$f # calibration function
 calib$params # the parametrs for f
 # note that calib could be refined by the user
 
 # now calibrate the hic matrix
 calibHiC = calibrate(hic, calib)
 plot(match$distances, calibHiC[upper.tri(calibHiC)],
 xlab = "distances", ylab = "calibrated distances")



