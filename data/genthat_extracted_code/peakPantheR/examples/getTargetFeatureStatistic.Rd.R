library(peakPantheR)


### Name: getTargetFeatureStatistic
### Title: Calculate chromatographic peak properties
### Aliases: getTargetFeatureStatistic

### ** Examples

## Not run: 
##D # fittedCurve
##D cFit1           <- list(amplitude=162404.8057918259, center=3341.888,
##D                         sigma=0.078786133031045896, gamma=0.0018336101984172684,
##D                         fitStatus=2, curveModel="skewedGaussian")
##D class(cFit1)    <- 'peakPantheR_curveFit'
##D cFit2           <- list(amplitude=199249.10572753669, center=3382.577,
##D                         sigma=0.074904415304607966, gamma=0.0011471899372353885,
##D                         fitStatus=2, curveModel="skewedGaussian")
##D class(cFit2)    <- 'peakPantheR_curveFit'
##D input_fitCurves <- list(cFit1, cFit2)
##D 
##D input_ROI       <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID", 
##D                      "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),
##D                      stringsAsFactors=F)
##D input_ROI[1,] 	<- c("ID-1", "testCpd 1", 3310., 3344.88, 3390., 522.19, 522.2, 522.21)
##D input_ROI[2,] 	<- c("ID-2", "testCpd 2", 3280., 3385.58, 3440., 496.19, 496.2, 496.21)
##D input_ROI[,3:8] <- sapply(input_ROI[,3:8], as.numeric)
##D 
##D # foundPeakTable
##D input_foundPeakTable      <- data.frame(matrix(vector(), 2, 10, dimnames=list(c(), 
##D                                c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax",
##D                                "peakArea", "maxIntMeasured", "maxIntPredicted"))),
##D                                stringsAsFactors=F)
##D input_foundPeakTable[1,]  <- c(TRUE, 3309.758, 3346.827, 3385.410, 522.19, 522.2, 522.21, 
##D                                26133726, 889280, 901015)
##D input_foundPeakTable[2,]  <- c(TRUE, 3345.376, 3386.529, 3428.279, 496.19, 496.2, 496.21,
##D                                35472141, 1128960, 1113576)
##D input_foundPeakTable[,1]  <- sapply(input_foundPeakTable[,c(1)], as.logical)
##D 
##D # Run peak statistics
##D peakStatistics <- getTargetFeatureStatistic(input_fitCurves, input_ROI, input_foundPeakTable)
##D peakStatistics   
##D #   found    rtMin       rt    rtMax  mzMin    mz  mzMax peakArea maxIntMeasured maxIntPredicted
##D # 1  TRUE 3309.758 3346.827 3385.410 522.19 522.2 522.21 26133726         889280          901015 
##D # 2  TRUE 3345.376 3386.529 3428.279 496.19 496.2 496.21 35472141        1128960         1113576
##D #   ppm_error rt_dev_sec tailingFactor asymmetryFactor
##D # 1        0      1.947      1.015385        1.026886
##D # 2        0      0.949      1.005372        1.009304
## End(Not run)



