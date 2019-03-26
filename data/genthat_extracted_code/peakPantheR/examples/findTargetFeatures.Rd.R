library(peakPantheR)


### Name: findTargetFeatures
### Title: Find and integrate target features in each ROI
### Aliases: findTargetFeatures

### ** Examples

## Not run: 
##D ## Load data
##D library(faahKO)
##D library(MSnbase)
##D netcdfFilePath <- system.file('cdf/KO/ko15.CDF', package = "faahKO")
##D raw_data       <- MSnbase::readMSData(netcdfFilePath, centroided=TRUE, mode='onDisk')
##D 
##D ## targetFeatTable
##D targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID",
##D                          "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),
##D                          stringsAsFactors=F)
##D targetFeatTable[1,] <- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
##D targetFeatTable[2,] <- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
##D targetFeatTable[,3:8] <- sapply(targetFeatTable[,3:8], as.numeric)
##D 
##D ROIsPt         <- extractSignalRawData(raw_data, rt=targetFeatTable[,c('rtMin','rtMax')],
##D                                        mz=targetFeatTable[,c('mzMin','mzMax')], verbose=TRUE)
##D # Reading data from 2 windows
##D 
##D foundPeaks <- findTargetFeatures(ROIsPt, targetFeatTable, verbose=T)
##D # Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation,
##D # approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1
##D # Found 2/2 features in 0.07 secs
##D 
##D foundPeaks
##D # $peakTable
##D #   found    rtMin       rt    rtMax    mzMin    mz    mzMax peakArea maxIntMeasured maxIntPredicted
##D # 1  TRUE 3309.759 3346.828 3385.410 522.1948 522.2 522.2052 26133727         889280        901015.8
##D # 2  TRUE 3345.377 3386.529 3428.279 496.2000 496.2 496.2000 35472141        1128960       1113576.7
##D #
##D # $curveFit
##D # $curveFit[[1]]
##D # $amplitude
##D # [1] 162404.8
##D # 
##D # $center
##D # [1] 3341.888
##D # 
##D # $sigma
##D # [1] 0.07878613
##D # 
##D # $gamma
##D # [1] 0.00183361
##D # 
##D # $fitStatus
##D # [1] 2
##D # 
##D # $curveModel
##D # [1] "skewedGaussian"
##D # 
##D # attr(,"class")
##D # [1] "peakPantheR_curveFit"
##D # 
##D # $curveFit[[2]]
##D # $amplitude
##D # [1] 199249.1
##D # 
##D # $center
##D # [1] 3382.577
##D # 
##D # $sigma
##D # [1] 0.07490442
##D # 
##D # $gamma
##D # [1] 0.00114719
##D # 
##D # $fitStatus
##D # [1] 2
##D # 
##D # $curveModel
##D # [1] "skewedGaussian"
##D # 
##D # attr(,"class")
##D # [1] "peakPantheR_curveFit"
## End(Not run)



