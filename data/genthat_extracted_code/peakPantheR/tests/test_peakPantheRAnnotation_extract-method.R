context('peakPantheRAnnotation_extract-method()')

## Test the extract sub-setting "[" method

skip_if(getRversion() >= "3.6")
skip_if_not_installed('faahKO',  minimum_version = '1.18.0')
library(faahKO)


## Input data
# spectraPaths
input_spectraPaths  <- c(system.file('cdf/KO/ko15.CDF', package = "faahKO"),
                         system.file('cdf/KO/ko16.CDF', package = "faahKO"),
                         system.file('cdf/KO/ko18.CDF', package = "faahKO"))

# targetFeatTable
input_targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
input_targetFeatTable[1,] <- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
input_targetFeatTable[2,] <- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
input_targetFeatTable[,c(3:8)] <- sapply(input_targetFeatTable[,c(3:8)], as.numeric)

# FIR
input_FIR     <- data.frame(matrix(vector(), 2, 4, dimnames=list(c(), c("rtMin", "rtMax", "mzMin", "mzMax"))), stringsAsFactors=F)
input_FIR[1,] <- c(1., 2., 3., 4.)
input_FIR[2,] <- c(5., 6., 7., 8.)

# uROI
input_uROI      <- data.frame(matrix(vector(), 2, 6, dimnames=list(c(), c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
input_uROI[1,]  <- c(9., 10., 11., 12., 13., 14.)
input_uROI[2,]  <- c(15., 16., 17., 18., 19., 20.)

# TICs
input_TIC <- c(2410533091, 2524040155, 2332817115)

# cpdMetadata
input_cpdMetadata     <- data.frame(matrix(data=c('a','b',1,2), nrow=2, ncol=2, dimnames=list(c(),c('testcol1','testcol2')), byrow=FALSE), stringsAsFactors=FALSE)

# spectraMetadata
input_spectraMetadata <- data.frame(matrix(data=c('c','d','e',3,4,5), nrow=3, ncol=2, dimnames=list(c(),c('testcol1','testcol2')), byrow=FALSE), stringsAsFactors=FALSE)

# acquisitionTime
input_acquisitionTime <- c(as.character(Sys.time()), as.character(Sys.time()+900), as.character(Sys.time()+1800))

# peakTables
# 1
peakTable1     <- data.frame(matrix(vector(), 2, 15, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted", "is_filled", "ppm_error", "rt_dev_sec", "tailingFactor", "asymmetryFactor"))),stringsAsFactors=F)
peakTable1[1,] <- c(TRUE, 3309.7589296586070, 3346.8277590361445, 3385.4098874628098, 522.194778, 522.20001220703125, 522.205222, 26133726.6811244078, 889280, 901015.80529226747, FALSE, 0.023376160866574614, 1.93975903614455092, 1.0153573486330891, 1.0268238825675249)
peakTable1[2,] <- c(TRUE, 3345.3766648628907, 3386.5288072289159, 3428.2788374983961, 496.20001220703125, 496.20001220703125, 496.20001220703125, 35472141.3330242932, 1128960, 1113576.69008227298, FALSE, 0.024601030353423384, 0.95180722891564074, 1.0053782620427065, 1.0093180792278085)
peakTable1[,c(1,11)]       <- sapply(peakTable1[,c(1,11)], as.logical)
peakTable1[,c(2:10,12:15)] <- sapply(peakTable1[,c(2:10,12:15)], as.numeric)
# 2
peakTable2     <- data.frame(matrix(vector(), 2, 15, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted", "is_filled", "ppm_error", "rt_dev_sec", "tailingFactor", "asymmetryFactor"))),stringsAsFactors=F)
peakTable2[1,] <- c(TRUE, 3326.1063495851854, 3365.102, 3407.2726475892355, 522.194778, 522.20001220703125, 522.205222, 24545301.622835573, 761664, 790802.2209998488, FALSE, 0.023376160866574614, 20.2139999999999, 1.0339153786516375, 1.0630802030537212)
peakTable2[2,] <- c(TRUE, 3365.0238566258713, 3405.791, 3453.4049569205681, 496.195038, 496.20001220703125, 496.204962, 37207579.286265120, 1099264, 1098720.2929832144, FALSE, 0.024601030353423384, 20.2139999999999, 1.0839602450900523, 1.1717845972583161)
peakTable2[,c(1,11)]       <- sapply(peakTable2[,c(1,11)], as.logical)
peakTable2[,c(2:10,12:15)] <- sapply(peakTable2[,c(2:10,12:15)], as.numeric)
# 3
peakTable3     <- data.frame(matrix(vector(), 2, 15, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted", "is_filled", "ppm_error", "rt_dev_sec", "tailingFactor", "asymmetryFactor"))),stringsAsFactors=F)
peakTable3[1,] <- c(TRUE, 3333.8625894557053, 3368.233, 3407.4362838927614, 522.194778, 522.20001220703125, 522.205222, 21447174.404490683, 758336, 765009.9805796633, FALSE, 0.023376160866574614, 23.345000000000255, 1.0609102044546637, 1.1155310457756928)
peakTable3[2,] <- c(TRUE, 3373.3998828113113, 3413.4952530120481, 3454.4490330927388, 496.195038, 496.20001220703125, 496.204962, 35659353.614476241, 1149440, 1145857.7611069249, FALSE, 0.024601030353423384, 27.918253012047899, 1.0081407426394933, 1.0143315197994494)
peakTable3[,c(1,11)]       <- sapply(peakTable3[,c(1,11)], as.logical)
peakTable3[,c(2:10,12:15)] <- sapply(peakTable3[,c(2:10,12:15)], as.numeric)
input_peakTables <- list(peakTable1, peakTable2, peakTable3)

# peakFit
# 1
cFit1.1         <- list(amplitude=162404.8057918259, center=3341.888, sigma=0.078786133031045896, gamma=0.0018336101984172684, fitStatus=2, curveModel="skewedGaussian")
class(cFit1.1)  <- 'peakPantheR_curveFit'
cFit1.2         <- list(amplitude=199249.10572753669, center=3382.577, sigma=0.074904415304607966, gamma=0.0011471899372353885, fitStatus=2, curveModel="skewedGaussian")
class(cFit1.2)  <- 'peakPantheR_curveFit'
# 2
cFit2.1         <- list(amplitude=124090.83425474487, center=3359.102, sigma=0.071061541060964212, gamma=0.0018336072657203239, fitStatus=2, curveModel="skewedGaussian")
class(cFit2.1)  <- 'peakPantheR_curveFit'
cFit2.2         <- list(amplitude=151407.23415130575, center=3399.791, sigma=0.063753866057052563, gamma=0.001676782834598999, fitStatus=2, curveModel="skewedGaussian")
class(cFit2.2)  <- 'peakPantheR_curveFit'
# 3
cFit3.1         <- list(amplitude=122363.51256736703, center=3362.233, sigma=0.075489598945304492, gamma=0.0025160536725299734, fitStatus=2, curveModel="skewedGaussian")
class(cFit3.1)  <- 'peakPantheR_curveFit'
cFit3.2         <- list(amplitude=204749.86097918145, center=3409.182, sigma=0.075731781812843249, gamma=0.0013318670577834328, fitStatus=2, curveModel="skewedGaussian")
class(cFit3.2)  <- 'peakPantheR_curveFit'
input_peakFit   <- list(list(cFit1.1, cFit1.2), list(cFit2.1, cFit2.2), list(cFit3.1, cFit3.2))

# dataPoint
tmp_raw_data1  	  <- MSnbase::readMSData(input_spectraPaths[1], centroided=TRUE, mode='onDisk')
ROIDataPoints1    <- extractSignalRawData(tmp_raw_data1, rt=input_targetFeatTable[,c('rtMin','rtMax')], mz=input_targetFeatTable[,c('mzMin','mzMax')], verbose=F)
tmp_raw_data2  	  <- MSnbase::readMSData(input_spectraPaths[2], centroided=TRUE, mode='onDisk')
ROIDataPoints2    <- extractSignalRawData(tmp_raw_data2, rt=input_targetFeatTable[,c('rtMin','rtMax')], mz=input_targetFeatTable[,c('mzMin','mzMax')], verbose=F)
tmp_raw_data3  	  <- MSnbase::readMSData(input_spectraPaths[3], centroided=TRUE, mode='onDisk')
ROIDataPoints3    <- extractSignalRawData(tmp_raw_data3, rt=input_targetFeatTable[,c('rtMin','rtMax')], mz=input_targetFeatTable[,c('mzMin','mzMax')], verbose=F)
input_dataPoints  <- list(ROIDataPoints1, ROIDataPoints2, ROIDataPoints3)

# Object, fully filled
filledAnnotation        <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, FIR=input_FIR, uROI=input_uROI, useFIR=TRUE, uROIExist=TRUE, useUROI=TRUE, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata, acquisitionTime=input_acquisitionTime, TIC=input_TIC, peakTables=input_peakTables, dataPoints=input_dataPoints, peakFit=input_peakFit, isAnnotated=TRUE)


test_that('no i j input returns an untouched object', {
  ## Expected values
  expected_ROI        <- input_targetFeatTable[, c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")]
  expected_peakTables <- input_peakTables
  expected_dataPoints <- input_dataPoints
  expected_peakFit    <- input_peakFit

  # no sub-setting
  noChange <- filledAnnotation[]

  # whole object
  expect_equal(noChange, filledAnnotation)
  # cpdID
  expect_equal(noChange@cpdID, c("ID-1", "ID-2"))
  # cpdName
  expect_equal(noChange@cpdName, c("Cpd 1", "Cpd 2"))
  # ROI
  expect_equal(noChange@ROI, expected_ROI)
  # FIR
  expect_equal(noChange@FIR, input_FIR)
  # uROI
  expect_equal(noChange@uROI, input_uROI)
  # filepath
  expect_equal(noChange@filepath, input_spectraPaths)
  # cpdMetadata
  expect_equal(noChange@cpdMetadata, input_cpdMetadata)
  # spectraMetadata
  expect_equal(noChange@spectraMetadata, input_spectraMetadata)
  # acquisitionTime
  expect_equal(noChange@acquisitionTime, input_acquisitionTime)
  # uROIExist
  expect_true(noChange@uROIExist)
  # useUROI
  expect_true(noChange@useUROI)
  # useFIR
  expect_true(noChange@useFIR)
  # TIC
  expect_equal(noChange@TIC, input_TIC)
  # peakTables
  expect_equal(noChange@peakTables, expected_peakTables)
  # dataPoints
  expect_equal(noChange@dataPoints, expected_dataPoints)
  # peakFit
  expect_equal(noChange@peakFit, expected_peakFit)
  # isAnnotated
  expect_true(noChange@isAnnotated)
})

test_that('missing i, set j', {
  ## i will default to all samples, set j

  ## Expected values
  expected_ROI          <- input_targetFeatTable[1, c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")]
  expected_FIR          <- input_FIR[1,]
  expected_uROI         <- input_uROI[1,]
  expected_cpdMetadata  <- input_cpdMetadata[1,]
  expected_peakTables   <- list(peakTable1[1,], peakTable2[1,], peakTable3[1,])
  expected_dataPoints   <- list(list(input_dataPoints[[1]][[1]]), list(input_dataPoints[[2]][[1]]), list(input_dataPoints[[3]][[1]]))
  expected_peakFit      <- list(list(input_peakFit[[1]][[1]]), list(input_peakFit[[2]][[1]]), list(input_peakFit[[3]][[1]]))

  # no sub-setting
  setJ <- filledAnnotation[,1]

  # cpdID
  expect_equal(setJ@cpdID, c("ID-1"))
  # cpdName
  expect_equal(setJ@cpdName, c("Cpd 1"))
  # ROI
  expect_equal(setJ@ROI, expected_ROI)
  # FIR
  expect_equal(setJ@FIR, expected_FIR)
  # uROI
  expect_equal(setJ@uROI, expected_uROI)
  # filepath
  expect_equal(setJ@filepath, input_spectraPaths)
  # cpdMetadata
  expect_equal(setJ@cpdMetadata, expected_cpdMetadata)
  # spectraMetadata
  expect_equal(setJ@spectraMetadata, input_spectraMetadata)
  # acquisitionTime
  expect_equal(setJ@acquisitionTime, input_acquisitionTime)
  # uROIExist
  expect_true(setJ@uROIExist)
  # useUROI
  expect_true(setJ@useUROI)
  # useFIR
  expect_true(setJ@useFIR)
  # TIC
  expect_equal(setJ@TIC, input_TIC)
  # peakTables
  expect_equal(setJ@peakTables, expected_peakTables)
  # dataPoints
  expect_equal(setJ@dataPoints, expected_dataPoints)
  # peakFit
  expect_equal(setJ@peakFit, expected_peakFit)
  # isAnnotated
  expect_true(setJ@isAnnotated)
})

test_that('set i, missing j', {
  ## set i, j will default to all compounds

  ## Expected values
  expected_ROI              <- input_targetFeatTable[, c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")]
  expected_FIR              <- input_FIR
  expected_uROI             <- input_uROI
  expected_filepath         <- input_spectraPaths[1:2]
  expected_spectraMetadata  <- input_spectraMetadata[1:2,]
  expected_acquisitionTime  <- input_acquisitionTime[1:2]
  expected_TIC              <- input_TIC[1:2]
  expected_peakTables       <- list(peakTable1, peakTable2)
  expected_dataPoints       <- input_dataPoints[1:2]
  expected_peakFit          <- input_peakFit[1:2]
  
  # no sub-setting
  setI <- filledAnnotation[1:2,]

  # cpdID
  expect_equal(setI@cpdID, c("ID-1", "ID-2"))
  # cpdName
  expect_equal(setI@cpdName, c("Cpd 1", "Cpd 2"))
  # ROI
  expect_equal(setI@ROI, expected_ROI)
  # FIR
  expect_equal(setI@FIR, expected_FIR)
  # uROI
  expect_equal(setI@uROI, expected_uROI)
  # filepath
  expect_equal(setI@filepath, expected_filepath)
  # cpdMetadata
  expect_equal(setI@cpdMetadata, input_cpdMetadata)
  # spectraMetadata
  expect_equal(setI@spectraMetadata, expected_spectraMetadata)
  # acquisitionTime
  expect_equal(setI@acquisitionTime, expected_acquisitionTime)
  # uROIExist
  expect_true(setI@uROIExist)
  # useUROI
  expect_true(setI@useUROI)
  # useFIR
  expect_true(setI@useFIR)
  # TIC
  expect_equal(setI@TIC, expected_TIC)
  # peakTables
  expect_equal(setI@peakTables, expected_peakTables)
  # dataPoints
  expect_equal(setI@dataPoints, expected_dataPoints)
  # peakFit
  expect_equal(setI@peakFit, expected_peakFit)
  # isAnnotated
  expect_true(setI@isAnnotated)
})

test_that('set i, empty peakTables, dataPoints and peakFit', {
  ## peakTables, dataPoints and peakFit are all NULL for the selected samples, trigger a special case

  ## object with cpd and spectra set
  defaultInit_cpd_spectra   <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata, isAnnotated=TRUE)

  ## Expected values
  expected_ROI              <- input_targetFeatTable[, c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")]
  expected_FIR              <- data.frame(matrix(vector(), 2, 4, dimnames=list(c(), c("rtMin", "rtMax", "mzMin", "mzMax"))), stringsAsFactors=F)
  expected_FIR[1,]          <- sapply(expected_FIR[1,], as.numeric)
  expected_FIR[2,]          <- sapply(expected_FIR[2,], as.numeric)
  expected_uROI             <- data.frame(matrix(vector(), 2, 6, dimnames=list(c(), c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
  expected_uROI[1,]         <- sapply(expected_uROI[1,], as.numeric)
  expected_uROI[2,]         <- sapply(expected_uROI[2,], as.numeric)
  expected_filepath         <- input_spectraPaths[1:2]
  expected_spectraMetadata  <- input_spectraMetadata[1:2,]
  expected_acquisitionTime  <- as.character(c(NA, NA))

  expected_peakTables <- vector("list", 2)
  expected_dataPoints <- vector("list", 2)
  expected_peakFit    <- vector("list", 2)

  # subset samples
  setIandNULL <- defaultInit_cpd_spectra[1:2,]

  # cpdID
  expect_equal(setIandNULL@cpdID, c("ID-1", "ID-2"))
  # cpdName
  expect_equal(setIandNULL@cpdName, c("Cpd 1", "Cpd 2"))
  # ROI
  expect_equal(setIandNULL@ROI, expected_ROI)
  # FIR
  expect_equal(setIandNULL@FIR, expected_FIR)
  # uROI
  expect_equal(setIandNULL@uROI, expected_uROI)
  # filepath
  expect_equal(setIandNULL@filepath, expected_filepath)
  # cpdMetadata
  expect_equal(setIandNULL@cpdMetadata, input_cpdMetadata)
  # spectraMetadata
  expect_equal(setIandNULL@spectraMetadata, expected_spectraMetadata)
  # acquisitionTime
  expect_equal(setIandNULL@acquisitionTime, expected_acquisitionTime)
  # uROIExist
  expect_false(setIandNULL@uROIExist)
  # useUROI
  expect_false(setIandNULL@useUROI)
  # useFIR
  expect_false(setIandNULL@useFIR)
  # TIC
  expect_equal(setIandNULL@TIC, c(as.numeric(NA), as.numeric(NA)))
  # peakTables
  expect_equal(setIandNULL@peakTables, expected_peakTables)
  # dataPoints
  expect_equal(setIandNULL@dataPoints, expected_dataPoints)
  # peakFit
  expect_equal(setIandNULL@peakFit, expected_peakFit)
  # isAnnotated
  expect_true(setIandNULL@isAnnotated)
})

test_that('set i and j', {
  ## set i and j

  ## Expected values
  expected_ROI              <- input_targetFeatTable[1, c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")]
  expected_FIR              <- input_FIR[1,]
  expected_uROI             <- input_uROI[1,]
  expected_filepath         <- input_spectraPaths[1:2]
  expected_cpdMetadata      <- input_cpdMetadata[1,]
  expected_spectraMetadata  <- input_spectraMetadata[1:2,]
  expected_acquisitionTime  <- input_acquisitionTime[1:2]
  expected_TIC              <- input_TIC[1:2]
  expected_peakTables       <- list(peakTable1[1,], peakTable2[1,])
  expected_dataPoints       <- list(input_dataPoints[[1]][1], input_dataPoints[[2]][1])
  expected_peakFit          <- list(input_peakFit[[1]][1], input_peakFit[[2]][1])

  # no sub-setting
  setIJ <- filledAnnotation[1:2,1]

  # cpdID
  expect_equal(setIJ@cpdID, c("ID-1"))
  # cpdName
  expect_equal(setIJ@cpdName, c("Cpd 1"))
  # ROI
  expect_equal(setIJ@ROI, expected_ROI)
  # FIR
  expect_equal(setIJ@FIR, expected_FIR)
  # uROI
  expect_equal(setIJ@uROI, expected_uROI)
  # filepath
  expect_equal(setIJ@filepath, expected_filepath)
  # cpdMetadata
  expect_equal(setIJ@cpdMetadata, expected_cpdMetadata)
  # spectraMetadata
  expect_equal(setIJ@spectraMetadata, expected_spectraMetadata)
  # acquisitionTime
  expect_equal(setIJ@acquisitionTime, expected_acquisitionTime)
  # uROIExist
  expect_true(setIJ@uROIExist)
  # useUROI
  expect_true(setIJ@useUROI)
  # useFIR
  expect_true(setIJ@useFIR)
  # TIC
  expect_equal(setIJ@TIC, expected_TIC)
  # peakTables
  expect_equal(setIJ@peakTables, expected_peakTables)
  # dataPoints
  expect_equal(setIJ@dataPoints, expected_dataPoints)
  # peakFit
  expect_equal(setIJ@peakFit, expected_peakFit)
  # isAnnotated
  expect_true(setIJ@isAnnotated)
})

test_that('reorder i and j', {
  ## reorder i and j

  ## Expected values
  expected_ROI              <- input_targetFeatTable[c(2,1), c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")]
  expected_FIR              <- input_FIR[c(2,1),]
  expected_uROI             <- input_uROI[c(2,1),]
  expected_filepath         <- input_spectraPaths[c(3,2,1)]
  expected_acquisitionTime  <- input_acquisitionTime[c(3,2,1)]
  expected_cpdMetadata      <- input_cpdMetadata[c(2,1),]
  expected_spectraMetadata  <- input_spectraMetadata[c(3,2,1),]
  expected_TIC              <- input_TIC[c(3,2,1)]
  expected_peakTables       <- list(peakTable3[c(2,1),], peakTable2[c(2,1),], peakTable1[c(2,1),])
  expected_dataPoints       <- list(input_dataPoints[[3]][c(2,1)], input_dataPoints[[2]][c(2,1)], input_dataPoints[[1]][c(2,1)])
  expected_peakFit          <- list(input_peakFit[[3]][c(2,1)], input_peakFit[[2]][c(2,1)], input_peakFit[[1]][c(2,1)])
  
  # no sub-setting
  reorderIJ <- filledAnnotation[3:1, c(2,1)]

  # cpdID
  expect_equal(reorderIJ@cpdID, c("ID-2", "ID-1"))
  # cpdName
  expect_equal(reorderIJ@cpdName, c("Cpd 2", "Cpd 1"))
  # ROI
  expect_equal(reorderIJ@ROI, expected_ROI)
  # FIR
  expect_equal(reorderIJ@FIR, expected_FIR)
  # uROI
  expect_equal(reorderIJ@uROI, expected_uROI)
  # filepath
  expect_equal(reorderIJ@filepath, expected_filepath)
  # cpdMetadata
  expect_equal(reorderIJ@cpdMetadata, expected_cpdMetadata)
  # spectraMetadata
  expect_equal(reorderIJ@spectraMetadata, expected_spectraMetadata)
  # acquisitionTime
  expect_equal(reorderIJ@acquisitionTime, expected_acquisitionTime)
  # uROIExist
  expect_true(reorderIJ@uROIExist)
  # useUROI
  expect_true(reorderIJ@useUROI)
  # useFIR
  expect_true(reorderIJ@useFIR)
  # TIC
  expect_equal(reorderIJ@TIC, expected_TIC)
  # peakTables
  expect_equal(reorderIJ@peakTables, expected_peakTables)
  # dataPoints
  expect_equal(reorderIJ@dataPoints, expected_dataPoints)
  # peakFit
  expect_equal(reorderIJ@peakFit, expected_peakFit)
  # isAnnotated
  expect_true(reorderIJ@isAnnotated)
})

test_that('raise error if i and j are out of bound', {
  # i out of bound
  msgI  <- paste('i index out of bound: maximum 3', sep='')
  expect_error(filledAnnotation[4,], msgI, fixed=TRUE)
  expect_error(filledAnnotation[10:15,], msgI, fixed=TRUE)

  # j out of bound
  msgJ  <- paste('j index out of bound: maximum 2', sep='')
  expect_error(filledAnnotation[,4], msgJ, fixed=TRUE)
  expect_error(filledAnnotation[,10:15], msgJ, fixed=TRUE)
})
