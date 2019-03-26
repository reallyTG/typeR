context('peakPantheRAnnotation_validObject-method()')

## Test the validObject method / valid_peakPantheRAnnotation function

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

# Object, no samples, no compounds
defaultInit_empty       <- peakPantheRAnnotation()
# Object, init samples and compounds
defaultInit_cpd_spectra <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable)
# Object, fully filled
filledAnnotation        <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata, acquisitionTime=input_acquisitionTime, TIC=input_TIC, peakTables=input_peakTables, dataPoints=input_dataPoints, peakFit=input_peakFit, isAnnotated=TRUE)


test_that('initialised objects are valid', {
  # no samples, no compounds
  expect_true(validObject(defaultInit_empty))
  # init samples and compounds
  expect_true(validObject(defaultInit_cpd_spectra))
})

test_that('a fully filled object is valid', {
  # fully filled
  expect_true(validObject(filledAnnotation))
})

test_that('validObject() raises errors', {
  # number of cpdName
  wrong1          <- filledAnnotation
  wrong1@cpdName  <- c("Cpd 1", "Cpd 2", "Cpd 3")
  msg1            <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: cpdName has 3 elements (compound). Should be 2', sep='')
  expect_error(validObject(wrong1), msg1, fixed=TRUE)

  # ROI number of rows
  wrong2          <- filledAnnotation
  wrong2@ROI      <- wrong2@ROI[1,]
  msg2            <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: ROI has 1 rows (compound). Should be 2', sep='')
  expect_error(validObject(wrong2), msg2, fixed=TRUE)
  # ROI number of columns
  wrong3          <- filledAnnotation
  wrong3@ROI      <- wrong3@ROI[,1:5]
  msg3            <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: ROI has 5 columns. Should be 6 ("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")', sep='')
  expect_error(validObject(wrong3), msg3, fixed=TRUE)
  # ROI column names
  wrong4                <- filledAnnotation
  colnames(wrong4@ROI)  <- c("wrongCol", "rt", "rtMax", "mzMin", "mz", "mzMax")
  msg4            <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: ROI columns should be "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", not wrongCol rt rtMax mzMin mz mzMax', sep='')
  expect_error(validObject(wrong4), msg4 , fixed=TRUE)
  # ROI$rtMin numeric
  wrong5            <- filledAnnotation
  wrong5@ROI$rtMin  <- c("not numeric", "not numeric")
  msg5              <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: ROI$rtMin should be numeric, not character', sep='')
  expect_error(validObject(wrong5), msg5, fixed=TRUE)
  # ROI$rt numeric
  wrong6            <- filledAnnotation
  wrong6@ROI$rt     <- c("not numeric", "not numeric")
  msg6              <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: ROI$rt should be numeric, not character', sep='')
  expect_error(validObject(wrong6), msg6, fixed=TRUE)
  # ROI$rtMax numeric
  wrong7            <- filledAnnotation
  wrong7@ROI$rtMax  <- c("not numeric", "not numeric")
  msg7              <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: ROI$rtMax should be numeric, not character', sep='')
  expect_error(validObject(wrong7), msg7, fixed=TRUE)
  # ROI$mzMin numeric
  wrong8            <- filledAnnotation
  wrong8@ROI$mzMin  <- c("not numeric", "not numeric")
  msg8              <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: ROI$mzMin should be numeric, not character', sep='')
  expect_error(validObject(wrong8), msg8, fixed=TRUE)
  # ROI$mz numeric
  wrong9            <- filledAnnotation
  wrong9@ROI$mz     <- c("not numeric", "not numeric")
  msg9              <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: ROI$mz should be numeric, not character', sep='')
  expect_error(validObject(wrong9), msg9, fixed=TRUE)
  # ROI$mzMax numeric
  wrong10            <- filledAnnotation
  wrong10@ROI$mzMax  <- c("not numeric", "not numeric")
  msg10              <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: ROI$mzMax should be numeric, not character', sep='')
  expect_error(validObject(wrong10), msg10, fixed=TRUE)

  # FIR number of rows
  wrong11          <- filledAnnotation
  wrong11@FIR      <- wrong11@FIR[1,]
  msg11            <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: FIR has 1 rows (compound). Should be 2', sep='')
  expect_error(validObject(wrong11), msg11, fixed=TRUE)
  # FIR number of columns
  wrong12          <- filledAnnotation
  wrong12@FIR      <- wrong12@FIR[,1:3]
  msg12            <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: FIR has 3 columns. Should be 4 ("rtMin", "rtMax", "mzMin", "mzMax")', sep='')
  expect_error(validObject(wrong12), msg12, fixed=TRUE)
  # FIR column names
  wrong13                 <- filledAnnotation
  colnames(wrong13@FIR)   <- c("wrongCol", "rtMax", "mzMin", "mzMax")
  msg13                   <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: FIR columns should be "rtMin", "rtMax", "mzMin", "mzMax", not wrongCol rtMax mzMin mzMax', sep='')
  expect_error(validObject(wrong13), msg13, fixed=TRUE)
  # FIR$rtMin numeric
  wrong14             <- filledAnnotation
  wrong14@FIR$rtMin   <- c("not numeric", "not numeric")
  msg14               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: FIR$rtMin should be numeric, not character', sep='')
  expect_error(validObject(wrong14), msg14, fixed=TRUE)
  # FIR$rtMax numeric
  wrong15             <- filledAnnotation
  wrong15@FIR$rtMax   <- c("not numeric", "not numeric")
  msg15               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: FIR$rtMax should be numeric, not character', sep='')
  expect_error(validObject(wrong15), msg15, fixed=TRUE)
  # FIR$mzMin numeric
  wrong16             <- filledAnnotation
  wrong16@FIR$mzMin   <- c("not numeric", "not numeric")
  msg16               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: FIR$mzMin should be numeric, not character', sep='')
  expect_error(validObject(wrong16), msg16, fixed=TRUE)
  # FIR$mzMax numeric
  wrong17             <- filledAnnotation
  wrong17@FIR$mzMax   <- c("not numeric", "not numeric")
  msg17               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: FIR$mzMax should be numeric, not character', sep='')
  expect_error(validObject(wrong17), msg17, fixed=TRUE)

  # uROI number of rows
  wrong18           <- filledAnnotation
  wrong18@uROI      <- wrong18@uROI[1,]
  msg18             <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: uROI has 1 rows (compound). Should be 2', sep='')
  expect_error(validObject(wrong18), msg18, fixed=TRUE)
  # uROI number of columns
  wrong19           <- filledAnnotation
  wrong19@uROI      <- wrong19@uROI[,1:5]
  msg19             <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: uROI has 5 columns. Should be 6 ("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")', sep='')
  expect_error(validObject(wrong19), msg19, fixed=TRUE)
  # uROI column names
  wrong20                 <- filledAnnotation
  colnames(wrong20@uROI)  <- c("wrongCol", "rt", "rtMax", "mzMin", "mz", "mzMax")
  msg20                   <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: uROI columns should be "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", not wrongCol rt rtMax mzMin mz mzMax', sep='')
  expect_error(validObject(wrong20), msg20, fixed=TRUE)
  # uROI$rtMin numeric
  wrong21             <- filledAnnotation
  wrong21@uROI$rtMin  <- c("not numeric", "not numeric")
  msg21               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: uROI$rtMin should be numeric, not character', sep='')
  expect_error(validObject(wrong21), msg21, fixed=TRUE)
  # uROI$rt numeric
  wrong22             <- filledAnnotation
  wrong22@uROI$rt     <- c("not numeric", "not numeric")
  msg22               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: uROI$rt should be numeric, not character', sep='')
  expect_error(validObject(wrong22), msg22, fixed=TRUE)
  # uROI$rtMax numeric
  wrong23             <- filledAnnotation
  wrong23@uROI$rtMax  <- c("not numeric", "not numeric")
  msg23               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: uROI$rtMax should be numeric, not character', sep='')
  expect_error(validObject(wrong23), msg23, fixed=TRUE)
  # uROI$mzMin numeric
  wrong24             <- filledAnnotation
  wrong24@uROI$mzMin  <- c("not numeric", "not numeric")
  msg24               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: uROI$mzMin should be numeric, not character', sep='')
  expect_error(validObject(wrong24), msg24, fixed=TRUE)
  # uROI$mz numeric
  wrong25             <- filledAnnotation
  wrong25@uROI$mz     <- c("not numeric", "not numeric")
  msg25               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: uROI$mz should be numeric, not character', sep='')
  expect_error(validObject(wrong25), msg25, fixed=TRUE)
  # uROI$mzMax numeric
  wrong26             <- filledAnnotation
  wrong26@uROI$mzMax  <- c("not numeric", "not numeric")
  msg26               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: uROI$mzMax should be numeric, not character', sep='')
  expect_error(validObject(wrong26), msg26, fixed=TRUE)

  # number of acquisitionTime
  wrong27                 <- filledAnnotation
  wrong27@acquisitionTime <- filledAnnotation@acquisitionTime[c(1,2)]
  msg27                   <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: acquisitionTime has 2 elements (samples). Should be 3', sep='')
  expect_error(validObject(wrong27), msg27, fixed=TRUE)
  
  # cannot useUROI=TRUE if uROIExist=FALSE
  wrong28           <- filledAnnotation
  wrong28@useUROI   <- TRUE
  wrong28@uROIExist <- FALSE
  msg28             <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: useUROI cannot be TRUE while uROIExist is FALSE', sep='')
  expect_error(validObject(wrong28), msg28, fixed=TRUE)
  
  # number of TIC
  wrong29       <- filledAnnotation
  wrong29@TIC   <- c(1, 2)
  msg29         <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: TIC has 2 elements (samples). Should be 3', sep='')
  expect_error(validObject(wrong29), msg29, fixed=TRUE)

  # number of peakTables
  wrong30             <- filledAnnotation
  wrong30@peakTables  <- wrong30@peakTables[1:2]
  msg30               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakTables has 2 elements (samples). Should be 3', sep='')
  expect_error(validObject(wrong30), msg30, fixed=TRUE)
  # not all peakTables are NULL or initialised
  wrong31             <- filledAnnotation
  wrong31@peakTables  <- list(NULL, wrong31@peakTables[[2]], wrong31@peakTables[[3]])
  msg31               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakTables must all either be data.frame or NULL', sep='')
  expect_error(validObject(wrong31), msg31, fixed=TRUE)
  # peakTables is data.frame
  wrong32             <- filledAnnotation
  wrong32@peakTables  <- list("not data.frame", "not data.frame", "not data.frame")
  msg32               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakTables must be data.frame or NULL not character', sep='')
  expect_error(validObject(wrong32), msg32, fixed=TRUE)
  # peakTables data.frame number of rows
  wrong33                 <- filledAnnotation
  wrong33@peakTables[[1]] <- wrong33@peakTables[[1]][1,]
  msg33                   <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakTables[[1]] has 1 rows (compounds). Should be 2', sep='')
  expect_error(validObject(wrong33), msg33, fixed=TRUE)
  # peakTables data.frame number of columns
  wrong34                 <- filledAnnotation
  wrong34@peakTables[[1]] <- wrong34@peakTables[[1]][,1:2]
  msg34                   <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakTables[[1]] has 2 columns. Should be 15', sep='')
  expect_error(validObject(wrong34), msg34, fixed=TRUE)
  # peakTables column names
  wrong35                           <- filledAnnotation
  colnames(wrong35@peakTables[[1]]) <- c('wrongCol', 'rt', 'rtMin', 'rtMax', 'mz', 'mzMin', 'mzMax', 'peakArea', 'maxIntMeasured', 'maxIntPredicted', 'is_filled', 'ppm_error', 'rt_dev_sec', 'tailingFactor', 'asymmetryFactor')
  msg35                             <- paste("invalid class ", dQuote('peakPantheRAnnotation')," object: peakTables[[1]] columns should be 'found', 'rt', 'rtMin', 'rtMax', 'mz', 'mzMin', 'mzMax', 'peakArea', 'maxIntMeasured', 'maxIntPredicted', 'is_filled', 'ppm_error', 'rt_dev_sec', 'tailingFactor', 'asymmetryFactor', not wrongCol rt rtMin rtMax mz mzMin mzMax peakArea maxIntMeasured maxIntPredicted is_filled ppm_error rt_dev_sec tailingFactor asymmetryFactor", sep='')
  expect_error(validObject(wrong35), msg35, fixed=TRUE)

  # number of dataPoints
  wrong36             <- filledAnnotation
  wrong36@dataPoints  <- wrong36@dataPoints[1:2]
  msg36               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: dataPoints has 2 elements (samples). Should be 3', sep='')
  expect_error(validObject(wrong36), msg36, fixed=TRUE)
  # not all dataPoints are NULL or initialised
  wrong37             <- filledAnnotation
  wrong37@dataPoints  <- list(NULL, wrong37@dataPoints[[2]], wrong37@dataPoints[[3]])
  msg37               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: dataPoints must all either be list of ROI data points or NULL', sep='')
  expect_error(validObject(wrong37), msg37, fixed=TRUE)
  # individual dataPoints is list
  wrong38             <- filledAnnotation
  wrong38@dataPoints  <- list("not list", "not list", "not list")
  msg38               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: dataPoints[[1]] must be a list of ROI data points, not character', sep='')
  expect_error(validObject(wrong38), msg38, fixed=TRUE)
  # individual dataPoints has entry for each compound
  wrong39                 <- filledAnnotation
  wrong39@dataPoints[[1]] <- list(wrong39@dataPoints[[1]][1])
  msg39                   <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: dataPoints[[1]] contains, 1 dataPoints (compound). Should be 2', sep='')
  expect_error(validObject(wrong39), msg39, fixed=TRUE)
  # individual dataPoints compound entry is data.frame
  wrong40                       <- filledAnnotation
  wrong40@dataPoints[[1]][[1]]  <- "not a data.frame"
  msg40                         <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: dataPoints[[1]][[1]] must be a data.frame, not character', sep='')
  expect_error(validObject(wrong40), msg40, fixed=TRUE)
  # individual dataPoints compound data.frame number of columns
  wrong41                       <- filledAnnotation
  wrong41@dataPoints[[1]][[1]]  <- wrong41@dataPoints[[1]][[1]][,1:2]
  msg41                         <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: dataPoints[[1]][[1]] has 2 columns. Should be 3', sep='')
  expect_error(validObject(wrong41), msg41, fixed=TRUE)
  # individual dataPoints compound data.frame column names
  wrong42                                 <- filledAnnotation
  colnames(wrong42@dataPoints[[1]][[1]])  <- c('wrongCol', 'mz', 'int')
  msg42                                   <- paste("invalid class ", dQuote('peakPantheRAnnotation')," object: dataPoints[[1]][[1]] columns should be 'rt', 'mz', 'int', not wrongCol mz int", sep="")
  expect_error(validObject(wrong42), msg42, fixed=TRUE)
  
  # number of peakFit
  wrong43         <- filledAnnotation
  wrong43@peakFit <- wrong43@peakFit[1:2]
  msg43           <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakFit has 2 elements (samples). Should be 3', sep='')
  expect_error(validObject(wrong43), msg43, fixed=TRUE)
  # not all peakFit are NULL or initialised
  wrong44         <- filledAnnotation
  wrong44@peakFit <- list(NULL, wrong44@peakFit[[2]], wrong44@peakFit[[3]])
  msg44           <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakFit must all either be list of ROI curveFit or NULL', sep='')
  expect_error(validObject(wrong44), msg44, fixed=TRUE)
  # individual peakFit is list
  wrong45         <- filledAnnotation
  wrong45@peakFit <- list("not list", "not list", "not list")
  msg45           <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakFit[[1]] must be a list of ROI curveFit or NA, not character', sep='')
  expect_error(validObject(wrong45), msg45, fixed=TRUE)
  # individual peakFit has entry for each compound
  wrong46               <- filledAnnotation
  wrong46@peakFit[[1]]  <- list(wrong46@peakFit[[1]][1])
  msg46                 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakFit[[1]] contains, 1 peakPantheR_curveFit or NA (compound). Should be 2', sep='')
  expect_error(validObject(wrong46), msg46, fixed=TRUE)
  # individual dataPoints compound entry is peakPantheR_curveFit or NA
  wrong47                   <- filledAnnotation
  wrong47@peakFit[[1]][[1]] <- "not a peakPantheR_curveFit or NA"
  msg47                     <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: peakFit[[1]][[1]] must be NA or a peakPantheR_curveFit, not character', sep='')
  expect_error(validObject(wrong47), msg47, fixed=TRUE)
  
  # number of cpdMetadata compounds (rows)
  wrong28             <- filledAnnotation
  wrong28@cpdMetadata <- filledAnnotation@cpdMetadata[c(1,2,1),]
  msg28               <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: cpdMetadata has 3 rows (compounds). Should be 2', sep='')
  expect_error(validObject(wrong28), msg28, fixed=TRUE)
  
  # number of spectraMetadata spectra (rows)
  wrong29                 <- filledAnnotation
  wrong29@spectraMetadata <- filledAnnotation@spectraMetadata[c(1,2),]
  msg29                   <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: spectraMetadata has 2 rows (spectra). Should be 3', sep='')
  expect_error(validObject(wrong29), msg29, fixed=TRUE)
})
