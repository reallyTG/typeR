library(peakPantheR)


### Name: peakPantheR_parallelAnnotation
### Title: Search, integrate and report targeted features in a multiple
###   spectra
### Aliases: peakPantheR_parallelAnnotation

### ** Examples

if(requireNamespace("faahKO") & getRversion()<"3.6"){
## Load data
library(faahKO)

# 3 files
input_spectraPaths <- c(system.file('cdf/KO/ko15.CDF', package = "faahKO"),
                        system.file('cdf/KO/ko16.CDF', package = "faahKO"),
                        system.file('cdf/KO/ko18.CDF', package = "faahKO"))

# 4 features
input_ROI     <- data.frame(matrix(vector(), 4, 8,
                                   dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt",
                                                        "rtMax", "mzMin", "mz", "mzMax"))),
                                   stringsAsFactors=F)
input_ROI[1,] <- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
input_ROI[2,] <- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
input_ROI[3,] <- c("ID-3", "Cpd 3", 3420., 3454.435, 3495., 464.195358, 464.2, 464.204642)
input_ROI[4,] <- c("ID-4", "Cpd 4", 3670., 3701.697, 3745., 536.194638, 536.2, 536.205362)
input_ROI[,c(3:8)] <- sapply(input_ROI[,c(3:8)], as.numeric)

# Initialise object
initAnnotation <- peakPantheRAnnotation(spectraPaths=input_spectraPaths,
                                        targetFeatTable=input_ROI)
# to use updated ROI:
# uROIExist=TRUE, useUROI=TRUE, uROI=input_uROI
# to use FallBack Integration Regions:
# useFIR=TRUE, FIR=input_FIR

# Run serially
result_parallelAnnotation <- peakPantheR_parallelAnnotation(initAnnotation, ncores=0,
                                                            getAcquTime=FALSE,
                                                            verbose=TRUE)
# Processing 4 compounds in 3 samples:
#  uROI:	FALSE
#  FIR:	FALSE
# ----- ko15 -----
# Polarity can not be extracted from netCDF files, please set manually the polarity
#  with the 'polarity' method.
# Reading data from 4 windows
# Data read in: 0.24 secs
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax 
#  calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax 
#  calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #3
# Found 4/4 features in 0.06 secs
# Peak statistics done in: 0.02 secs
# Feature search done in: 0.76 secs
# ----- ko16 -----
# Polarity can not be extracted from netCDF files, please set manually the polarity
#  with the 'polarity' method.
# Reading data from 4 windows
# Data read in: 0.24 secs
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax 
#  calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax 
#  calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #2
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax 
#  calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #3
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax 
#  calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #4
# Found 4/4 features in 0.08 secs
# Peak statistics done in: 0 secs
# Feature search done in: 0.71 secs
# ----- ko18 -----
# Polarity can not be extracted from netCDF files, please set manually the polarity 
#  with the 'polarity' method.
# Reading data from 4 windows
# Data read in: 0.25 secs
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax 
#  calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax 
#  calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #2
# Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax 
#  calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #4
# Found 4/4 features in 0.06 secs
# Peak statistics done in: 0 secs
# Feature search done in: 0.71 secs
# ----------------
# Parallel annotation done in: 2.18 secs

# No failures
result_parallelAnnotation$failures
result_parallelAnnotation$annotation
# An object of class peakPantheRAnnotation
#  4 compounds in 3 samples. 
#    updated ROI do not exist (uROI)
#    does not use updated ROI (uROI)
#    does not use fallback integration regions (FIR)
#    is annotated
}




