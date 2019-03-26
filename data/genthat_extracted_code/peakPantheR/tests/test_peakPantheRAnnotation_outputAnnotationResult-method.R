context('outputAnnotationResult()')

## Test the CSV output of all annotation results

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
input_TIC       <- c(2410533091, 2524040155, 2332817115)

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
peakTable3[2,] <- c(TRUE, 3373.3998828113113, 3413.4952530120481, 3454.4490330927388, 496.195038, 496.20001220703125, 496.204962, 35659353.614476241, 1149440, 1145857.7611069249, TRUE, 0.024601030353423384, 27.918253012047899, 1.0081407426394933, 1.0143315197994494)
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



test_that('csv output with FIR, verbose, no verbose', {
  # temporary file
  savePath1         <- tempdir()
  
  # input
  input_annotation  <- filledAnnotation
  
  # expected
  expected_path_cpdMeta     <- file.path(savePath1, "testProject_cpdMetadata.csv")
  expected_path_specMeta    <- file.path(savePath1, "testProject_spectraMetadata.csv")
  expected_path_summary     <- file.path(savePath1, "testProject_summary.csv")
  expected_path_asym        <- file.path(savePath1, "testProject_asymmetryFactor.csv")
  expected_path_found       <- file.path(savePath1, "testProject_found.csv")
  expected_path_is_filled   <- file.path(savePath1, "testProject_is_filled.csv")
  expected_path_maxIntMeas  <- file.path(savePath1, "testProject_maxIntMeasured.csv")
  expected_path_maxIntPred  <- file.path(savePath1, "testProject_maxIntPredicted.csv")
  expected_path_mz          <- file.path(savePath1, "testProject_mz.csv")
  expected_path_mzMax       <- file.path(savePath1, "testProject_mzMax.csv")
  expected_path_mzMin       <- file.path(savePath1, "testProject_mzMin.csv")
  expected_path_peakArea    <- file.path(savePath1, "testProject_peakArea.csv")
  expected_path_ppmErr      <- file.path(savePath1, "testProject_ppm_error.csv")
  expected_path_rt          <- file.path(savePath1, "testProject_rt.csv")
  expected_path_rtDev       <- file.path(savePath1, "testProject_rt_dev_sec.csv")
  expected_path_rtMax       <- file.path(savePath1, "testProject_rtMax.csv")
  expected_path_rtMin       <- file.path(savePath1, "testProject_rtMin.csv")
  expected_path_tailfact    <- file.path(savePath1, "testProject_tailingFactor.csv")
  
  # expected values
  expected_cpdMeta          <- data.frame(matrix(data=c('ID-1','Cpd 1','a',1,'ID-2','Cpd 2','b',2), nrow=2,ncol=4,dimnames=list(c(), c('cpdID', 'cpdName', 'testcol1', 'testcol2')), byrow=TRUE), stringsAsFactors=FALSE)
  expected_cpdMeta$testcol2  <- as.numeric(expected_cpdMeta$testcol2)
  expected_specMeta     <- data.frame(matrix(nrow=3,ncol=4,dimnames=list(c(), c('acquisitionTime', 'TIC', 'testcol1', 'testcol2')), byrow=TRUE), stringsAsFactors=FALSE) # no filepath
  expected_specMeta$acquisitionTime <- input_acquisitionTime
  expected_specMeta$TIC             <- input_TIC
  expected_specMeta$testcol1        <- input_spectraMetadata$testcol1
  expected_specMeta$testcol2        <- as.numeric(input_spectraMetadata$testcol2)
  expected_summary        <- data.frame(matrix(data=c('Cpd 1 - ID-1',1,0,0.02337616,8.499586, 'Cpd 2 - ID-2',0.6666667,0.333333,0.02460103,16.361353), nrow=2,ncol=5,dimnames=list(c(), c('X', 'ratio_peaks_found', 'ratio_peaks_filled', 'ppm_error', 'rt_dev_sec')), byrow=TRUE), stringsAsFactors=FALSE)
  expected_summary[,2:5]  <- sapply(expected_summary[,2:5], as.numeric)
  expected_asym         <- annotationTable(input_annotation, column='asymmetryFactor')
  expected_asym         <- data.frame(X=rownames(expected_asym), ID.1=expected_asym$`ID-1`, ID.2=expected_asym$`ID-2`, stringsAsFactors=FALSE)
  expected_found        <- annotationTable(input_annotation, column='found')
  expected_found        <- data.frame(X=rownames(expected_found), ID.1=expected_found$`ID-1`, ID.2=expected_found$`ID-2`, stringsAsFactors=FALSE)
  expected_is_filled    <- annotationTable(input_annotation, column='is_filled')
  expected_is_filled    <- data.frame(X=rownames(expected_is_filled), ID.1=expected_is_filled$`ID-1`, ID.2=expected_is_filled$`ID-2`, stringsAsFactors=FALSE)
  expected_maxIntMeas   <- annotationTable(input_annotation, column='maxIntMeasured')
  expected_maxIntMeas   <- data.frame(X=rownames(expected_maxIntMeas), ID.1=expected_maxIntMeas$`ID-1`, ID.2=expected_maxIntMeas$`ID-2`, stringsAsFactors=FALSE)
  expected_maxIntPred   <- annotationTable(input_annotation, column='maxIntPredicted')
  expected_maxIntPred   <- data.frame(X=rownames(expected_maxIntPred), ID.1=expected_maxIntPred$`ID-1`, ID.2=expected_maxIntPred$`ID-2`, stringsAsFactors=FALSE)
  expected_mz           <- annotationTable(input_annotation, column='mz')
  expected_mz           <- data.frame(X=rownames(expected_mz), ID.1=expected_mz$`ID-1`, ID.2=expected_mz$`ID-2`, stringsAsFactors=FALSE)
  expected_mzMax        <- annotationTable(input_annotation, column='mzMax')
  expected_mzMax        <- data.frame(X=rownames(expected_mzMax), ID.1=expected_mzMax$`ID-1`, ID.2=expected_mzMax$`ID-2`, stringsAsFactors=FALSE)
  expected_mzMin        <- annotationTable(input_annotation, column='mzMin')
  expected_mzMin        <- data.frame(X=rownames(expected_mzMin), ID.1=expected_mzMin$`ID-1`, ID.2=expected_mzMin$`ID-2`, stringsAsFactors=FALSE)
  expected_peakArea     <- annotationTable(input_annotation, column='peakArea')
  expected_peakArea     <- data.frame(X=rownames(expected_peakArea), ID.1=expected_peakArea$`ID-1`, ID.2=expected_peakArea$`ID-2`, stringsAsFactors=FALSE)
  expected_ppmErr       <- annotationTable(input_annotation, column='ppm_error')
  expected_ppmErr       <- data.frame(X=rownames(expected_ppmErr), ID.1=expected_ppmErr$`ID-1`, ID.2=expected_ppmErr$`ID-2`, stringsAsFactors=FALSE)
  expected_rt           <- annotationTable(input_annotation, column='rt')
  expected_rt           <- data.frame(X=rownames(expected_rt), ID.1=expected_rt$`ID-1`, ID.2=expected_rt$`ID-2`, stringsAsFactors=FALSE)
  expected_rtDev        <- annotationTable(input_annotation, column='rt_dev_sec')
  expected_rtDev        <- data.frame(X=rownames(expected_rtDev), ID.1=expected_rtDev$`ID-1`, ID.2=expected_rtDev$`ID-2`, stringsAsFactors=FALSE)
  expected_rtMax        <- annotationTable(input_annotation, column='rtMax')
  expected_rtMax        <- data.frame(X=rownames(expected_rtMax), ID.1=expected_rtMax$`ID-1`, ID.2=expected_rtMax$`ID-2`, stringsAsFactors=FALSE)
  expected_rtMin        <- annotationTable(input_annotation, column='rtMin')
  expected_rtMin        <- data.frame(X=rownames(expected_rtMin), ID.1=expected_rtMin$`ID-1`, ID.2=expected_rtMin$`ID-2`, stringsAsFactors=FALSE)
  expected_tailfact     <- annotationTable(input_annotation, column='tailingFactor')
  expected_tailfact     <- data.frame(X=rownames(expected_tailfact), ID.1=expected_tailfact$`ID-1`, ID.2=expected_tailfact$`ID-2`, stringsAsFactors=FALSE)
  
  # results (output, warnings and messages)
  result_save     <- evaluate_promise(outputAnnotationResult(input_annotation, saveFolder=savePath1, annotationName='testProject', verbose=TRUE))
  
  # Check CSV has been produced
  expect_true(all(file.exists(expected_path_cpdMeta, expected_path_specMeta, expected_path_summary, expected_path_asym, expected_path_found, expected_path_is_filled,  expected_path_maxIntMeas,  expected_path_maxIntPred, expected_path_mz, expected_path_mzMax, expected_path_mzMin, expected_path_peakArea, expected_path_ppmErr, expected_path_rt, expected_path_rtDev, expected_path_rtMax, expected_path_rtMin, expected_path_tailfact)))
  
  # Check values saved
  saved_cpdMeta     <- read.csv(expected_path_cpdMeta, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_cpdMeta, expected_cpdMeta)
  saved_specMeta    <- read.csv(expected_path_specMeta, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE) # no filepath
  expect_equal(saved_specMeta[,-1], expected_specMeta)
  saved_summary     <- read.csv(expected_path_summary, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_summary, expected_summary, tolerance=1e-6)
  saved_asym        <- read.csv(expected_path_asym, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_asym, expected_asym)
  saved_found       <- read.csv(expected_path_found, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_found, expected_found)
  saved_is_filled   <- read.csv(expected_path_is_filled, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_is_filled, expected_is_filled)
  saved_maxIntMeas  <- read.csv(expected_path_maxIntMeas, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_maxIntMeas, expected_maxIntMeas)
  saved_maxIntPred  <- read.csv(expected_path_maxIntPred, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_maxIntPred, expected_maxIntPred)
  saved_mz          <- read.csv(expected_path_mz, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_mz, expected_mz)
  saved_mzMax       <- read.csv(expected_path_mzMax, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_mzMax, expected_mzMax)
  saved_mzMin       <- read.csv(expected_path_mzMin, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_mzMin, expected_mzMin)
  saved_peakArea    <- read.csv(expected_path_peakArea, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_peakArea, expected_peakArea)
  saved_ppmErr      <- read.csv(expected_path_ppmErr, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_ppmErr, expected_ppmErr)
  saved_rt          <- read.csv(expected_path_rt, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_rt, expected_rt)
  saved_rtDev       <- read.csv(expected_path_rtDev, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_rtDev, expected_rtDev)
  saved_rtMax       <- read.csv(expected_path_rtMax, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_rtMax, expected_rtMax)
  saved_rtMin       <- read.csv(expected_path_rtMin, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_rtMin, expected_rtMin)
  saved_tailfact    <- read.csv(expected_path_tailfact, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_tailfact, expected_tailfact)
  
  # Check result messages (save path)
  expect_equal(length(result_save$messages), 18)
  
  ## no verbose
  savePath2       <- tempdir()
  result_save2    <- evaluate_promise(outputAnnotationResult(input_annotation, saveFolder=savePath2, annotationName='testProject', verbose=FALSE))
  expect_equal(length(result_save2$messages), 0)
})

test_that('csv output without FIR, verbose, no verbose', {
  # temporary file
  savePath3         <- tempdir()
  # clear temp folder
  suppressWarnings(do.call(file.remove, list(list.files(savePath3, full.names = TRUE))))
  
  # input
  filledAnnotation2   <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, FIR=input_FIR, uROI=input_uROI, useFIR=FALSE, uROIExist=TRUE, useUROI=TRUE, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata, acquisitionTime=input_acquisitionTime, TIC=input_TIC, peakTables=input_peakTables, dataPoints=input_dataPoints, peakFit=input_peakFit, isAnnotated=TRUE)
  input_annotation    <- filledAnnotation2
  
  # expected
  expected_path_cpdMeta     <- file.path(savePath3, "testProject_cpdMetadata.csv")
  expected_path_specMeta    <- file.path(savePath3, "testProject_spectraMetadata.csv")
  expected_path_summary     <- file.path(savePath3, "testProject_summary.csv")
  expected_path_asym        <- file.path(savePath3, "testProject_asymmetryFactor.csv")
  expected_path_found       <- file.path(savePath3, "testProject_found.csv")
  expected_path_is_filled   <- file.path(savePath3, "testProject_is_filled.csv")
  expected_path_maxIntMeas  <- file.path(savePath3, "testProject_maxIntMeasured.csv")
  expected_path_maxIntPred  <- file.path(savePath3, "testProject_maxIntPredicted.csv")
  expected_path_mz          <- file.path(savePath3, "testProject_mz.csv")
  expected_path_mzMax       <- file.path(savePath3, "testProject_mzMax.csv")
  expected_path_mzMin       <- file.path(savePath3, "testProject_mzMin.csv")
  expected_path_peakArea    <- file.path(savePath3, "testProject_peakArea.csv")
  expected_path_ppmErr      <- file.path(savePath3, "testProject_ppm_error.csv")
  expected_path_rt          <- file.path(savePath3, "testProject_rt.csv")
  expected_path_rtDev       <- file.path(savePath3, "testProject_rt_dev_sec.csv")
  expected_path_rtMax       <- file.path(savePath3, "testProject_rtMax.csv")
  expected_path_rtMin       <- file.path(savePath3, "testProject_rtMin.csv")
  expected_path_tailfact    <- file.path(savePath3, "testProject_tailingFactor.csv")
  
  # expected values
  expected_cpdMeta          <- data.frame(matrix(data=c('ID-1','Cpd 1','a',1,'ID-2','Cpd 2','b',2), nrow=2,ncol=4,dimnames=list(c(), c('cpdID', 'cpdName', 'testcol1', 'testcol2')), byrow=TRUE), stringsAsFactors=FALSE)
  expected_cpdMeta$testcol2  <- as.numeric(expected_cpdMeta$testcol2)
  expected_specMeta     <- data.frame(matrix(nrow=3,ncol=4,dimnames=list(c(), c('acquisitionTime', 'TIC', 'testcol1', 'testcol2')), byrow=TRUE), stringsAsFactors=FALSE) # no filepath
  expected_specMeta$acquisitionTime <- input_acquisitionTime
  expected_specMeta$TIC             <- input_TIC
  expected_specMeta$testcol1        <- input_spectraMetadata$testcol1
  expected_specMeta$testcol2        <- as.numeric(input_spectraMetadata$testcol2)
  expected_summary        <- data.frame(matrix(data=c('Cpd 1 - ID-1',1,0,0.02337616,8.499586, 'Cpd 2 - ID-2',1,0,0.02460103,16.361353), nrow=2,ncol=5,dimnames=list(c(), c('X', 'ratio_peaks_found', 'ratio_peaks_filled', 'ppm_error', 'rt_dev_sec')), byrow=TRUE), stringsAsFactors=FALSE)
  expected_summary[,2:5]  <- sapply(expected_summary[,2:5], as.numeric)
  expected_asym         <- annotationTable(input_annotation, column='asymmetryFactor')
  expected_asym         <- data.frame(X=rownames(expected_asym), ID.1=expected_asym$`ID-1`, ID.2=expected_asym$`ID-2`, stringsAsFactors=FALSE)
  expected_found        <- annotationTable(input_annotation, column='found')
  expected_found        <- data.frame(X=rownames(expected_found), ID.1=expected_found$`ID-1`, ID.2=expected_found$`ID-2`, stringsAsFactors=FALSE)
  expected_is_filled    <- annotationTable(input_annotation, column='is_filled')
  expected_is_filled    <- data.frame(X=rownames(expected_is_filled), ID.1=expected_is_filled$`ID-1`, ID.2=expected_is_filled$`ID-2`, stringsAsFactors=FALSE)
  expected_maxIntMeas   <- annotationTable(input_annotation, column='maxIntMeasured')
  expected_maxIntMeas   <- data.frame(X=rownames(expected_maxIntMeas), ID.1=expected_maxIntMeas$`ID-1`, ID.2=expected_maxIntMeas$`ID-2`, stringsAsFactors=FALSE)
  expected_maxIntPred   <- annotationTable(input_annotation, column='maxIntPredicted')
  expected_maxIntPred   <- data.frame(X=rownames(expected_maxIntPred), ID.1=expected_maxIntPred$`ID-1`, ID.2=expected_maxIntPred$`ID-2`, stringsAsFactors=FALSE)
  expected_mz           <- annotationTable(input_annotation, column='mz')
  expected_mz           <- data.frame(X=rownames(expected_mz), ID.1=expected_mz$`ID-1`, ID.2=expected_mz$`ID-2`, stringsAsFactors=FALSE)
  expected_mzMax        <- annotationTable(input_annotation, column='mzMax')
  expected_mzMax        <- data.frame(X=rownames(expected_mzMax), ID.1=expected_mzMax$`ID-1`, ID.2=expected_mzMax$`ID-2`, stringsAsFactors=FALSE)
  expected_mzMin        <- annotationTable(input_annotation, column='mzMin')
  expected_mzMin        <- data.frame(X=rownames(expected_mzMin), ID.1=expected_mzMin$`ID-1`, ID.2=expected_mzMin$`ID-2`, stringsAsFactors=FALSE)
  expected_peakArea     <- annotationTable(input_annotation, column='peakArea')
  expected_peakArea     <- data.frame(X=rownames(expected_peakArea), ID.1=expected_peakArea$`ID-1`, ID.2=expected_peakArea$`ID-2`, stringsAsFactors=FALSE)
  expected_ppmErr       <- annotationTable(input_annotation, column='ppm_error')
  expected_ppmErr       <- data.frame(X=rownames(expected_ppmErr), ID.1=expected_ppmErr$`ID-1`, ID.2=expected_ppmErr$`ID-2`, stringsAsFactors=FALSE)
  expected_rt           <- annotationTable(input_annotation, column='rt')
  expected_rt           <- data.frame(X=rownames(expected_rt), ID.1=expected_rt$`ID-1`, ID.2=expected_rt$`ID-2`, stringsAsFactors=FALSE)
  expected_rtDev        <- annotationTable(input_annotation, column='rt_dev_sec')
  expected_rtDev        <- data.frame(X=rownames(expected_rtDev), ID.1=expected_rtDev$`ID-1`, ID.2=expected_rtDev$`ID-2`, stringsAsFactors=FALSE)
  expected_rtMax        <- annotationTable(input_annotation, column='rtMax')
  expected_rtMax        <- data.frame(X=rownames(expected_rtMax), ID.1=expected_rtMax$`ID-1`, ID.2=expected_rtMax$`ID-2`, stringsAsFactors=FALSE)
  expected_rtMin        <- annotationTable(input_annotation, column='rtMin')
  expected_rtMin        <- data.frame(X=rownames(expected_rtMin), ID.1=expected_rtMin$`ID-1`, ID.2=expected_rtMin$`ID-2`, stringsAsFactors=FALSE)
  expected_tailfact     <- annotationTable(input_annotation, column='tailingFactor')
  expected_tailfact     <- data.frame(X=rownames(expected_tailfact), ID.1=expected_tailfact$`ID-1`, ID.2=expected_tailfact$`ID-2`, stringsAsFactors=FALSE)
  
  # results (output, warnings and messages)
  result_save     <- evaluate_promise(outputAnnotationResult(input_annotation, saveFolder=savePath3, annotationName='testProject', verbose=TRUE))
  
  # Check CSV has been produced
  expect_true(all(file.exists(expected_path_cpdMeta, expected_path_specMeta, expected_path_summary, expected_path_asym, expected_path_found, expected_path_is_filled,  expected_path_maxIntMeas,  expected_path_maxIntPred, expected_path_mz, expected_path_mzMax, expected_path_mzMin, expected_path_peakArea, expected_path_ppmErr, expected_path_rt, expected_path_rtDev, expected_path_rtMax, expected_path_rtMin, expected_path_tailfact)))
  
  # Check values saved
  saved_cpdMeta     <- read.csv(expected_path_cpdMeta, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_cpdMeta, expected_cpdMeta)
  saved_specMeta    <- read.csv(expected_path_specMeta, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE) # no filepath
  expect_equal(saved_specMeta[,-1], expected_specMeta)
  saved_summary     <- read.csv(expected_path_summary, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_summary, expected_summary, tolerance=1e-6)
  saved_asym        <- read.csv(expected_path_asym, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_asym, expected_asym)
  saved_found       <- read.csv(expected_path_found, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_found, expected_found)
  saved_is_filled   <- read.csv(expected_path_is_filled, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_is_filled, expected_is_filled)
  saved_maxIntMeas  <- read.csv(expected_path_maxIntMeas, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_maxIntMeas, expected_maxIntMeas)
  saved_maxIntPred  <- read.csv(expected_path_maxIntPred, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_maxIntPred, expected_maxIntPred)
  saved_mz          <- read.csv(expected_path_mz, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_mz, expected_mz)
  saved_mzMax       <- read.csv(expected_path_mzMax, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_mzMax, expected_mzMax)
  saved_mzMin       <- read.csv(expected_path_mzMin, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_mzMin, expected_mzMin)
  saved_peakArea    <- read.csv(expected_path_peakArea, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_peakArea, expected_peakArea)
  saved_ppmErr      <- read.csv(expected_path_ppmErr, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_ppmErr, expected_ppmErr)
  saved_rt          <- read.csv(expected_path_rt, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_rt, expected_rt)
  saved_rtDev       <- read.csv(expected_path_rtDev, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_rtDev, expected_rtDev)
  saved_rtMax       <- read.csv(expected_path_rtMax, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_rtMax, expected_rtMax)
  saved_rtMin       <- read.csv(expected_path_rtMin, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_rtMin, expected_rtMin)
  saved_tailfact    <- read.csv(expected_path_tailfact, header=TRUE, sep=",", quote="\"", stringsAsFactors=FALSE)
  expect_equal(saved_tailfact, expected_tailfact)
  
  # Check result messages (save path)
  expect_equal(length(result_save$messages), 18)
  
  ## no verbose
  savePath4       <- tempdir()
  result_save4    <- evaluate_promise(outputAnnotationResult(input_annotation, saveFolder=savePath4, annotationName='testProject', verbose=FALSE))
  expect_equal(length(result_save4$messages), 0)
})


test_that('raise error', {
  # error if object is not annotated
  savePath1         <- tempdir()
  input_annotation  <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable)
  msg1              <- 'Object has not been annotated, no annotation results to save'
  expect_error(outputAnnotationResult(input_annotation, saveFolder=savePath1), msg1, fixed=TRUE)
})
