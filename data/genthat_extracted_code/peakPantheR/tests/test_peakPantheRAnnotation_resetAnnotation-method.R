context('resetAnnotation()')

## Test the annotation reset and setting of new parameters

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
peakTable2[1,] <- c(TRUE, 3326.1063495851854, 3365.102, 3407.2726475892355, 522.194778, 522.20001220703125, 522.205222, 24545301.622835573, 761664, 790802.2209998488, FALSE, 0.023376160866574614, 0.2139999999999, 1.0339153786516375, 1.0630802030537212)
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
filledAnnotation  <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, FIR=input_FIR, uROI=input_uROI, useFIR=TRUE, uROIExist=TRUE, useUROI=TRUE, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata, acquisitionTime=input_acquisitionTime, TIC=input_TIC, peakTables=input_peakTables, dataPoints=input_dataPoints, peakFit=input_peakFit, isAnnotated=TRUE)



test_that('reset, no size change', {
  # input
  input_annotation  <- filledAnnotation

  # expected
  expected_annotation <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata, FIR=input_FIR, uROI=input_uROI, useFIR=TRUE, uROIExist=TRUE, useUROI=TRUE)
  expected_message    <- c('peakPantheRAnnotation object being reset:\n', '  Previous "ROI", "cpdID" and "cpdName" value kept\n', '  Previous "uROI" value kept\n', '  Previous "FIR" value kept\n', '  Previous "cpdMetadata" value kept\n', '  Previous "filepath" value kept\n', '  Previous "spectraMetadata" value kept\n', '  Previous "uROIExist" value kept\n', '  Previous "useUROI" value kept\n', '  Previous "useFIR" value kept\n')
  
  # results (output, warnings and messages)
  result_reset        <- evaluate_promise(resetAnnotation(input_annotation, verbose=TRUE))
  
  # Check result
  expect_equal(result_reset$result, expected_annotation)
  
  # Check result messages
  expect_equal(length(result_reset$messages), 10)
  expect_equal(result_reset$messages, expected_message)
  
  ## no verbose
  result_reset2       <- evaluate_promise(resetAnnotation(input_annotation, verbose=FALSE))
  expect_equal(length(result_reset2$messages), 0)
})

test_that('change number of spectra and spectraMetadata', {
  # input
  input_annotation  <- filledAnnotation
  
  # expected
  tmp_spectraPaths      <- input_spectraPaths[1:2]
  tmp_spectraMetadata   <- input_spectraMetadata[1:2,]
  expected_annotation   <- peakPantheRAnnotation(spectraPaths=tmp_spectraPaths, targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata, spectraMetadata=tmp_spectraMetadata, FIR=input_FIR, uROI=input_uROI, useFIR=TRUE, uROIExist=TRUE, useUROI=TRUE)
  expected_message    <- c('peakPantheRAnnotation object being reset:\n', '  Previous "ROI", "cpdID" and "cpdName" value kept\n', '  Previous "uROI" value kept\n', '  Previous "FIR" value kept\n', '  Previous "cpdMetadata" value kept\n', '  New "spectraPaths" value set\n', '  New "spectraMetadata" value set\n', '  Previous "uROIExist" value kept\n', '  Previous "useUROI" value kept\n', '  Previous "useFIR" value kept\n')
  
  # results (output, warnings and messages)
  result_reset        <- evaluate_promise(resetAnnotation(input_annotation, spectraPaths=tmp_spectraPaths, spectraMetadata=tmp_spectraMetadata, verbose=TRUE))
  
  # Check result
  expect_equal(result_reset$result, expected_annotation)
  
  # Check result messages
  expect_equal(length(result_reset$messages), 10)
  expect_equal(result_reset$messages, expected_message)
  
  ## no verbose
  result_reset2       <- evaluate_promise(resetAnnotation(input_annotation, spectraPaths=tmp_spectraPaths, spectraMetadata=tmp_spectraMetadata, verbose=FALSE))
  expect_equal(length(result_reset2$messages), 0)
})

test_that('change number of spectra but not spectraMetadata (reset them to default)', {
  # input
  input_annotation  <- filledAnnotation
  
  # expected
  tmp_spectraPaths      <- input_spectraPaths[1:2]
  expected_annotation   <- peakPantheRAnnotation(spectraPaths=tmp_spectraPaths, targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata, FIR=input_FIR, uROI=input_uROI, useFIR=TRUE, uROIExist=TRUE, useUROI=TRUE)
  expected_message    <- c('peakPantheRAnnotation object being reset:\n', '  Previous "ROI", "cpdID" and "cpdName" value kept\n', '  Previous "uROI" value kept\n', '  Previous "FIR" value kept\n', '  Previous "cpdMetadata" value kept\n', '  New "spectraPaths" value set\n', '  Targeted spectra changed, previous "spectraMetadata" cannot be kept and set to default\n', '  Previous "uROIExist" value kept\n', '  Previous "useUROI" value kept\n', '  Previous "useFIR" value kept\n')
  
  # results (output, warnings and messages)
  result_reset        <- evaluate_promise(resetAnnotation(input_annotation, spectraPaths=tmp_spectraPaths, verbose=TRUE))
  
  # Check result
  expect_equal(result_reset$result, expected_annotation)
  
  # Check result messages
  expect_equal(length(result_reset$messages), 10)
  expect_equal(result_reset$messages, expected_message)
  
  ## no verbose
  result_reset2       <- evaluate_promise(resetAnnotation(input_annotation, spectraPaths=tmp_spectraPaths, verbose=FALSE))
  expect_equal(length(result_reset2$messages), 0)
})

test_that('change number of compounds, uROI, FIR, uROIExist, useUROI, useFIR, cpdMetadata', {
  # input
  input_annotation  <- filledAnnotation
  
  # expected
  tmp_targetFeatTable   <- input_targetFeatTable[1,]
  tmp_cpdMetadata       <- input_cpdMetadata[1,]
  tmp_uROI              <- input_uROI[1,]
  tmp_FIR               <- input_FIR[1,]
  expected_annotation   <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=tmp_targetFeatTable, cpdMetadata=tmp_cpdMetadata, spectraMetadata=input_spectraMetadata, FIR=tmp_FIR, uROI=tmp_uROI, useFIR=FALSE, uROIExist=FALSE, useUROI=FALSE)
  expected_message    <- c('peakPantheRAnnotation object being reset:\n', '  New "targetFeatTable" value set ("ROI", "cpdID", "cpdName"\n', '  New "uROI" value set\n', '  New "FIR" value set\n', '  New "cpdMetadata" value set\n', '  Previous "filepath" value kept\n', '  Previous "spectraMetadata" value kept\n', '  New "uROIExist" value set\n', '  New "useUROI" value set\n', '  New "useFIR" value set\n')
  
  # results (output, warnings and messages)
  result_reset        <- evaluate_promise(resetAnnotation(input_annotation, targetFeatTable=tmp_targetFeatTable, cpdMetadata=tmp_cpdMetadata, FIR=tmp_FIR, uROI=tmp_uROI, useFIR=FALSE, uROIExist=FALSE, useUROI=FALSE, verbose=TRUE))
  
  # Check result
  expect_equal(result_reset$result, expected_annotation)
  
  # Check result messages
  expect_equal(length(result_reset$messages), 10)
  expect_equal(result_reset$messages, expected_message)
  
  ## no verbose
  result_reset2       <- evaluate_promise(resetAnnotation(input_annotation, targetFeatTable=tmp_targetFeatTable, cpdMetadata=tmp_cpdMetadata, FIR=tmp_FIR, uROI=tmp_uROI, useFIR=FALSE, uROIExist=FALSE, useUROI=FALSE, verbose=FALSE))
  expect_equal(length(result_reset2$messages), 0)
})

test_that('change number of compounds but not uROI, FIR, uROIExist, useUROI, useFIR, cpdMetadata (reset them to default)', {
  # input
  input_annotation  <- filledAnnotation
  
  # expected
  tmp_targetFeatTable   <- input_targetFeatTable[1,]
  expected_annotation   <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=tmp_targetFeatTable, spectraMetadata=input_spectraMetadata)
  expected_message    <- c('peakPantheRAnnotation object being reset:\n', '  New "targetFeatTable" value set ("ROI", "cpdID", "cpdName"\n', '  Targeted compounds changed, previous "uROI" cannot be kept and set to default\n', '  Targeted compounds changed, previous "FIR" cannot be kept and set to default\n', '  Targeted compounds changed, previous "cpdMetadata" cannot be kept and set to default\n', '  Previous "filepath" value kept\n', '  Previous "spectraMetadata" value kept\n', '  Targeted compounds changed, previous "uROIExist" cannot be kept and set to default\n', '  Targeted compounds changed, previous "useUROI" cannot be kept and set to default\n', '  Targeted compounds changed, previous "useFIR" cannot be kept and set to default\n')
  
  # results (output, warnings and messages)
  result_reset        <- evaluate_promise(resetAnnotation(input_annotation, targetFeatTable=tmp_targetFeatTable, verbose=TRUE))
  
  # Check result
  expect_equal(result_reset$result, expected_annotation)
  
  # Check result messages
  expect_equal(length(result_reset$messages), 10)
  expect_equal(result_reset$messages, expected_message)
  
  ## no verbose
  result_reset2       <- evaluate_promise(resetAnnotation(input_annotation, targetFeatTable=tmp_targetFeatTable, verbose=FALSE))
  expect_equal(length(result_reset2$messages), 0)
})

test_that('change uROI, FIR, uROIExist, useUROI, useFIR, cpdMetadata and spectraMetadata (but not spectra and targetFeatTable)', {
  # input
  input_annotation  <- filledAnnotation
  
  # expected
  tmp_spectraMetadata   <- input_spectraMetadata[,1,drop=FALSE]
  tmp_cpdMetadata       <- input_cpdMetadata[,1,drop=FALSE]
  tmp_uROI              <- input_uROI
  tmp_uROI[2,]          <- c(100, 101, 102, 103, 104, 105)
  tmp_FIR               <- input_FIR
  tmp_FIR[2,]           <- c(106, 107, 108, 109)
  expected_annotation   <- peakPantheRAnnotation(targetFeatTable=input_targetFeatTable, spectraPaths=input_spectraPaths, cpdMetadata=tmp_cpdMetadata, spectraMetadata=tmp_spectraMetadata, FIR=tmp_FIR, uROI=tmp_uROI, useFIR=TRUE, uROIExist=TRUE, useUROI=TRUE)
  expected_message    <- c('peakPantheRAnnotation object being reset:\n', '  Previous "ROI", "cpdID" and "cpdName" value kept\n', '  New "uROI" value set\n', '  New "FIR" value set\n', '  New "cpdMetadata" value set\n', '  Previous "filepath" value kept\n', '  New "spectraMetadata" value set\n', '  Previous "uROIExist" value kept\n', '  Previous "useUROI" value kept\n', '  Previous "useFIR" value kept\n')
  
  # results (output, warnings and messages)
  result_reset        <- evaluate_promise(resetAnnotation(input_annotation, cpdMetadata=tmp_cpdMetadata, spectraMetadata=tmp_spectraMetadata, FIR=tmp_FIR, uROI=tmp_uROI, verbose=TRUE))
  
  # Check result
  expect_equal(result_reset$result, expected_annotation)
  
  # Check result messages
  expect_equal(length(result_reset$messages), 10)
  expect_equal(result_reset$messages, expected_message)
  
  ## no verbose
  result_reset2       <- evaluate_promise(resetAnnotation(input_annotation, cpdMetadata=tmp_cpdMetadata, spectraMetadata=tmp_spectraMetadata, FIR=tmp_FIR, uROI=tmp_uROI, verbose=FALSE))
  expect_equal(length(result_reset2$messages), 0)
})


