context('peakPantheRAnnotation_accessor-method()')

## Test the accessors with the right values

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
filledAnnotation        <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, FIR=input_FIR, uROI=input_uROI, useFIR=TRUE, uROIExist=TRUE, useUROI=TRUE, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata, acquisitionTime=input_acquisitionTime, TIC=input_TIC, peakTables=input_peakTables, dataPoints=input_dataPoints, peakFit=input_peakFit, isAnnotated=TRUE)



test_that('accessors return the correct values', {
  expected_ROI              <- input_targetFeatTable[, c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "cpdID", "cpdName")]
  expected_FIR              <- cbind.data.frame(input_FIR, cpdID=c("ID-1","ID-2"), cpdName=c("Cpd 1", "Cpd 2"), stringsAsFactors=FALSE)
  expected_uROI             <- cbind.data.frame(input_uROI, cpdID=c("ID-1","ID-2"), cpdName=c("Cpd 1", "Cpd 2"), stringsAsFactors=FALSE)
  expected_acquisitionTime  <- as.POSIXct(input_acquisitionTime)
  expected_peakTables       <- list(cbind.data.frame(peakTable1, cpdID=c("ID-1","ID-2"), cpdName=c("Cpd 1","Cpd 2"), stringsAsFactors=F), cbind.data.frame(peakTable2, cpdID=c("ID-1","ID-2"), cpdName=c("Cpd 1","Cpd 2"), stringsAsFactors=F), cbind.data.frame(peakTable3, cpdID=c("ID-1","ID-2"), cpdName=c("Cpd 1","Cpd 2"), stringsAsFactors=F))
  expected_dataPoints       <- input_dataPoints
  expected_peakFit          <- input_peakFit
  expected_filename         <- c("ko15", "ko16", "ko18")

  # Check accessors
  # Basic slots
  # cpdID
  expect_equal(cpdID(filledAnnotation), c("ID-1","ID-2"))
  # cpdName
  expect_equal(cpdName(filledAnnotation), c("Cpd 1", "Cpd 2"))
  # ROI
  expect_equal(ROI(filledAnnotation), expected_ROI)
  # FIR
  expect_equal(FIR(filledAnnotation), expected_FIR)
  # uROI
  expect_equal(uROI(filledAnnotation), expected_uROI)
  # filepath
  expect_equal(filepath(filledAnnotation), input_spectraPaths)
  # cpdMetadata
  expect_equal(cpdMetadata(filledAnnotation), input_cpdMetadata)
  # spectraMetadata
  expect_equal(spectraMetadata(filledAnnotation), input_spectraMetadata)
  # acquisitionTIme
  expect_equal(acquisitionTime(filledAnnotation), expected_acquisitionTime)
  # uROIExist
  expect_true(uROIExist(filledAnnotation))
  # useUROI
  expect_true(useUROI(filledAnnotation))
  # useFIR
  expect_true(useFIR(filledAnnotation))
  # TIC
  expect_equal(TIC(filledAnnotation), input_TIC)
  # peakTables
  expect_equal(peakTables(filledAnnotation), expected_peakTables)
  # dataPoints
  expect_equal(dataPoints(filledAnnotation), expected_dataPoints)
  # peakFit
  expect_equal(peakFit(filledAnnotation), expected_peakFit)
  # isAnnotated
  expect_true(isAnnotated(filledAnnotation))

  # nbSamples
  expect_equal(nbSamples(filledAnnotation), 3)
  # nbCompounds
  expect_equal(nbCompounds(filledAnnotation), 2)
  # filename
  expect_equal(filename(filledAnnotation), expected_filename)

  # annotationTable
  # simple value
  expected_annotationTable            <- data.frame(matrix(c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE), 3, 2), stringsAsFactors=F)
  rownames(expected_annotationTable)  <- input_spectraPaths
  colnames(expected_annotationTable)  <- c("ID-1", "ID-2")
  expect_equal(annotationTable(filledAnnotation, 'found'), expected_annotationTable)
  # no sample
  tmp_noSample                <- peakPantheRAnnotation()
  expected_noSample           <- data.frame(matrix(vector(), 0, 0), stringsAsFactors=F)
  rownames(expected_noSample) <- tmp_noSample@filepath
  colnames(expected_noSample) <- tmp_noSample@cpdID
  expect_equal(annotationTable(tmp_noSample, 'found'), expected_noSample)
  # no peakTables (not annotated or no compounds)
  tmp_noPeakTables            <- filledAnnotation
  tmp_noPeakTables@peakTables <- vector("list", 3)
  expected_noPeakTables           <- data.frame(matrix(vector(), 3, 2), stringsAsFactors=F)
  rownames(expected_noPeakTables) <- tmp_noPeakTables@filepath
  colnames(expected_noPeakTables) <- tmp_noPeakTables@cpdID
  expect_equal(annotationTable(tmp_noPeakTables, 'found'), expected_noPeakTables)
  # only 1 compounds (sapply simplify to vector and not matrix)
  tmp_singleCpd         <- filledAnnotation[,1]
  expected_mz           <- data.frame(matrix(c(522.20001220703125, 522.20001220703125, 522.20001220703125), 3, 1), stringsAsFactors=F)
  rownames(expected_mz) <- filledAnnotation@filepath
  colnames(expected_mz) <- filledAnnotation@cpdID[1]
  expect_equal(annotationTable(tmp_singleCpd, 'mz'), expected_mz)
  # raise error if column doesn't exist
  expect_error(annotationTable(filledAnnotation, 'notAnExistingColumn'), 'input column is not a column of peakTables', fixed=TRUE)

  ## try some more of the peakTable columns
  # mz
  expected_mz           <- data.frame(matrix(c(522.20001220703125, 522.20001220703125, 522.20001220703125, 496.20001220703125, 496.20001220703125, 496.20001220703125), 3, 2), stringsAsFactors=F)
  rownames(expected_mz) <- filledAnnotation@filepath
  colnames(expected_mz) <- filledAnnotation@cpdID
  expect_equal(annotationTable(filledAnnotation, 'mz'), expected_mz)
  # mzMin
  expected_mzMin           <- data.frame(matrix(c(522.194778, 522.194778, 522.194778, 496.20001220703125, 496.195038, 496.195038), 3, 2), stringsAsFactors=F)
  rownames(expected_mzMin) <- filledAnnotation@filepath
  colnames(expected_mzMin) <- filledAnnotation@cpdID
  expect_equal(annotationTable(filledAnnotation, 'mzMin'), expected_mzMin)
  # mzMax
  expected_mzMax           <- data.frame(matrix(c(522.205222, 522.205222, 522.205222, 496.20001220703125, 496.204962, 496.204962), 3, 2), stringsAsFactors=F)
  rownames(expected_mzMax) <- filledAnnotation@filepath
  colnames(expected_mzMax) <- filledAnnotation@cpdID
  expect_equal(annotationTable(filledAnnotation, 'mzMax'), expected_mzMax)
  # rt
  expected_rt           <- data.frame(matrix(c(3346.8277590361445, 3365.102, 3368.233, 3386.5288072289159, 3405.791, 3413.4952530120481), 3, 2), stringsAsFactors=F)
  rownames(expected_rt) <- filledAnnotation@filepath
  colnames(expected_rt) <- filledAnnotation@cpdID
  expect_equal(annotationTable(filledAnnotation, 'rt'), expected_rt)
  # rtMin
  expected_rtMin           <- data.frame(matrix(c(3309.7589296586070, 3326.1063495851854, 3333.8625894557053, 3345.3766648628907, 3365.0238566258713, 3373.3998828113113), 3, 2), stringsAsFactors=F)
  rownames(expected_rtMin) <- filledAnnotation@filepath
  colnames(expected_rtMin) <- filledAnnotation@cpdID
  expect_equal(annotationTable(filledAnnotation, 'rtMin'), expected_rtMin)
  # rtMax
  expected_rtMax           <- data.frame(matrix(c(3385.4098874628098, 3407.2726475892355, 3407.4362838927614, 3428.2788374983961, 3453.4049569205681, 3454.4490330927388), 3, 2), stringsAsFactors=F)
  rownames(expected_rtMax) <- filledAnnotation@filepath
  colnames(expected_rtMax) <- filledAnnotation@cpdID
  expect_equal(annotationTable(filledAnnotation, 'rtMax'), expected_rtMax)
  # peakArea
  expected_peakArea           <- data.frame(matrix(c(26133726.6811244078, 24545301.622835573, 21447174.404490683, 35472141.3330242932, 37207579.286265120, 35659353.614476241), 3, 2), stringsAsFactors=F)
  rownames(expected_peakArea) <- filledAnnotation@filepath
  colnames(expected_peakArea) <- filledAnnotation@cpdID
  expect_equal(annotationTable(filledAnnotation, 'peakArea'), expected_peakArea)
  
  # EICs
  # default (sum)
  tmp_EIC_sum_1.1   <- generateIonChromatogram(input_dataPoints[[1]][[1]], aggregationFunction='sum')
  tmp_EIC_sum_1.2   <- generateIonChromatogram(input_dataPoints[[1]][[2]], aggregationFunction='sum')
  tmp_EIC_sum_2.1   <- generateIonChromatogram(input_dataPoints[[2]][[1]], aggregationFunction='sum')
  tmp_EIC_sum_2.2   <- generateIonChromatogram(input_dataPoints[[2]][[2]], aggregationFunction='sum')
  tmp_EIC_sum_3.1   <- generateIonChromatogram(input_dataPoints[[3]][[1]], aggregationFunction='sum')
  tmp_EIC_sum_3.2   <- generateIonChromatogram(input_dataPoints[[3]][[2]], aggregationFunction='sum')
  expected_EIC_sum  <- list(list(tmp_EIC_sum_1.1, tmp_EIC_sum_1.2),
                            list(tmp_EIC_sum_2.1, tmp_EIC_sum_2.2),
                            list(tmp_EIC_sum_3.1, tmp_EIC_sum_3.2))
  expect_equal(EICs(filledAnnotation), expected_EIC_sum)
  # change aggregationFunction (max)
  tmp_EIC_max_1.1   <- generateIonChromatogram(input_dataPoints[[1]][[1]], aggregationFunction='max')
  tmp_EIC_max_1.2   <- generateIonChromatogram(input_dataPoints[[1]][[2]], aggregationFunction='max')
  tmp_EIC_max_2.1   <- generateIonChromatogram(input_dataPoints[[2]][[1]], aggregationFunction='max')
  tmp_EIC_max_2.2   <- generateIonChromatogram(input_dataPoints[[2]][[2]], aggregationFunction='max')
  tmp_EIC_max_3.1   <- generateIonChromatogram(input_dataPoints[[3]][[1]], aggregationFunction='max')
  tmp_EIC_max_3.2   <- generateIonChromatogram(input_dataPoints[[3]][[2]], aggregationFunction='max')
  expected_EIC_max  <- list(list(tmp_EIC_max_1.1, tmp_EIC_max_1.2),
                            list(tmp_EIC_max_2.1, tmp_EIC_max_2.2),
                            list(tmp_EIC_max_3.1, tmp_EIC_max_3.2))
  expect_equal(EICs(filledAnnotation, 'max'), expected_EIC_max)
})

