library(peakPantheR)


### Name: peakPantheR_singleFileSearch
### Title: Search, integrate and report targeted features in a raw spectra
### Aliases: peakPantheR_singleFileSearch

### ** Examples

if(requireNamespace("faahKO") & getRversion()<"3.6"){
## Load data
library(faahKO)
netcdfFilePath <- system.file('cdf/KO/ko15.CDF', package = "faahKO")

## targetFeatTable
targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID",
                         "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),
                         stringsAsFactors=F)
targetFeatTable[1,] <- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
targetFeatTable[2,] <- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
targetFeatTable[,c(3:8)] <- sapply(targetFeatTable[,c(3:8)], as.numeric)

res <- peakPantheR_singleFileSearch(netcdfFilePath,targetFeatTable, peakStatistic=TRUE)
# Polarity can not be extracted from netCDF files, please set manually the polarity with the
#   'polarity' method.
# Reading data from 2 windows
# Data read in: 0.16 secs
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation,
#   approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1
# Found 2/2 features in 0.05 secs
# Peak statistics done in: 0 secs
# Feature search done in: 0.75 secs

res
# $TIC
# [1] 2410533091
#
# $peakTable
#   found    rtMin       rt    rtMax    mzMin    mz    mzMax peakArea maxIntMeasured
# 1  TRUE 3309.759 3346.828 3385.410 522.1948 522.2 522.2052 26133727         889280
# 2  TRUE 3345.377 3386.529 3428.279 496.2000 496.2 496.2000 35472141        1128960
#   maxIntPredicted cpdID cpdName is_filled  ppm_error rt_dev_sec tailingFactor
# 1        901015.8  ID-1   Cpd 1     FALSE 0.02337616  1.9397590      1.015357
# 2       1113576.7  ID-2   Cpd 2     FALSE 0.02460103  0.9518072      1.005378
#    asymmetryFactor
# 1        1.026824
# 2        1.009318
#
# $acquTime
# [1] NA
#
#
# $curveFit
# $curveFit[[1]]
# $amplitude
# [1] 162404.8
# 
# $center
# [1] 3341.888
# 
# $sigma
# [1] 0.07878613
# 
# $gamma
# [1] 0.00183361
# 
# $fitStatus
# [1] 2
# 
# $curveModel
# [1] "skewedGaussian"
# 
# attr(,"class")
# [1] "peakPantheR_curveFit"
# 
# $curveFit[[2]]
# $amplitude
# [1] 199249.1
# 
# $center
# [1] 3382.577
# 
# $sigma
# [1] 0.07490442
# 
# $gamma
# [1] 0.00114719
# 
# $fitStatus
# [1] 2
# 
# $curveModel
# [1] "skewedGaussian"
# 
# attr(,"class")
# [1] "peakPantheR_curveFit"
#
#
# $ROIsDataPoint
# $ROIsDataPoint[[1]]
#          rt    mz    int
# 1  3315.154 522.2   2187
# 2  3316.719 522.2   3534
# 3  3318.284 522.2   6338
# 4  3319.849 522.2  11718
# 5  3321.414 522.2  21744
# 6  3322.979 522.2  37872
# 7  3324.544 522.2  62424
# 8  3326.109 522.2  98408
# 9  3327.673 522.2 152896
# 10 3329.238 522.2 225984
# ...
#
# $ROIsDataPoint[[2]]
#          rt    mz     int
# 1  3280.725 496.2    1349
# 2  3290.115 496.2    2069
# 3  3291.680 496.2    3103
# 4  3293.245 496.2    5570
# 5  3294.809 496.2   10730
# 6  3296.374 496.2   20904
# 7  3297.939 496.2   38712
# 8  3299.504 496.2   64368
# 9  3301.069 496.2   97096
# 10 3302.634 496.2  136320
# ...
}




