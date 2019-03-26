library(peakPantheR)


### Name: peakPantheRAnnotation
### Title: An S4 class to represent peakPantheR annotation results
### Aliases: peakPantheRAnnotation peakPantheRAnnotation-class
###   peakPantheRAnnotation

### ** Examples

if(requireNamespace("faahKO") & getRversion()<"3.6"){
## Initialise a peakPantheRAnnotation object with 3 samples and 2 targeted compounds

# Paths to spectra files
library(faahKO)
spectraPaths <- c(system.file('cdf/KO/ko15.CDF', package = "faahKO"),
                  system.file('cdf/KO/ko16.CDF', package = "faahKO"),
                  system.file('cdf/KO/ko18.CDF', package = "faahKO"))

# targetFeatTable
targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID",
                         "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),
                         stringsAsFactors=F)
targetFeatTable[1,] <- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
targetFeatTable[2,] <- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
targetFeatTable[,c(3:8)] <- sapply(targetFeatTable[,c(3:8)], as.numeric)

annotation <- peakPantheRAnnotation(spectraPaths=spectraPaths, targetFeatTable=targetFeatTable)

annotation
# An object of class peakPantheRAnnotation
#  2 compounds in 3 samples.
#   updated ROI do not exist (uROI)
#   does not use updated ROI (uROI)
#   does not use fallback integration regions (FIR)
#   is not annotated

slotNames(annotation)
# [1] "cpdID"       "cpdName"         "ROI"             "FIR"       "uROI"        "filepath"       
# [7] "cpdMetadata" "spectraMetadata" "acquisitionTime" "uROIExist" "useUROI"     "useFIR"         
# [13] "TIC"        "peakTables"      "dataPoints"      "peakFit"   "isAnnotated"

annotation@cpdID
# [1] "ID-1" "ID-2"
annotation@cpdName
# [1] "Cpd 1" "Cpd 2"
annotation@ROI
#   rtMin       rt rtMax    mzMin    mz    mzMax
# 1  3310 3344.888  3390 522.1948 522.2 522.2052
# 2  3280 3385.577  3440 496.1950 496.2 496.2050
annotation@FIR
#   rtMin rtMax mzMin mzMax
# 1    NA    NA    NA    NA
# 2    NA    NA    NA    NA
annotation@uROI
#   rtMin rt rtMax mzMin mz mzMax
# 1    NA NA    NA    NA NA    NA
# 2    NA NA    NA    NA NA    NA
annotation@filepath
# [1] "C:/R/R-3.4.3/library/faahKO/cdf/KO/ko15.CDF" "C:/R/R-3.4.3/library/faahKO/cdf/KO/ko16.CDF"
# [2] "C:/R/R-3.4.3/library/faahKO/cdf/KO/ko18.CDF"
annotation@cpdMetadata
# data frame with 0 columns and 2 rows
annotation@spectraMetadata
# data frame with 0 columns and 3 rows
annotation@acquisitionTime
# [1] NA NA NA
annotation@uROIExist
# [1] FALSE
annotation@useUROI
# [1] FALSE
annotation@useFIR
# [1] FALSE
annotation@TIC
# [1] NA NA NA
annotation@peakTables
# [[1]]
# NULL
# [[2]]
# NULL
# [[3]]
# NULL
annotation@dataPoints
# [[1]]
# NULL
# [[2]]
# NULL
# [[3]]
# NULL
annotation@peakFit
# [[1]]
# NULL
# [[2]]
# NULL
# [[3]]
# NULL
annotation@isAnnotated
# [1] FALSE
}




