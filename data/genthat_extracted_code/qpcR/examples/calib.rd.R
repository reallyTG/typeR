library(qpcR)


### Name: calib
### Title: Calculation of qPCR efficiency using dilution curves and
###   replicate bootstrapping
### Aliases: calib
### Keywords: models nonlinear

### ** Examples

## Define calibration curves,
## dilutions (or copy numbers) 
## and curves to be predicted.
## Do background subtraction using
## average of first 8 cycles. No replicates.
CAL <- modlist(reps, fluo = c(2, 6, 10, 14, 18, 22), 
               baseline = "mean", basecyc = 1:8)
COPIES <- c(100000, 10000, 1000, 100, 10, 1)
PRED <- modlist(reps, fluo = c(3, 7, 11), 
                baseline = "mean", basecyc = 1:8)

## Conduct normal quantification using
## the second derivative maximum of first curve.
calib(refcurve = CAL, predcurve = PRED, thresh = "cpD2", 
       dil = COPIES, plot = FALSE) 

## Using a defined treshold value.
#calib(refcurve = CAL, predcurve = PRED, thresh = 0.5, dil = COPIES) 

## Using six dilutions with four replicates/dilution.
## Not run: 
##D #CAL2 <- modlist(reps, fluo = 2:25)
##D #calib(refcurve = CAL2, predcurve = PRED, thresh = "cpD2", 
##D #      dil = COPIES, group = gl(6,4)) 
## End(Not run) 



