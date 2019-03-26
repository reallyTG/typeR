context('peakPantheR_parallelAnnotation()')

skip_if(getRversion() >= "3.6")
skip_if_not_installed('faahKO',  minimum_version = '1.18.0')
library(faahKO)


## Input and expected data
# 3 files
input_spectraPaths          <- c(system.file('cdf/KO/ko15.CDF', package = "faahKO"),
                                 system.file('cdf/KO/ko16.CDF', package = "faahKO"),
                                 system.file('cdf/KO/ko18.CDF', package = "faahKO"))
## 1 missing file
input_missingSpectraPaths   <- c(system.file('cdf/KO/ko15.CDF', package = "faahKO"),
                                 "aaa/bbb.cdf",
                                 system.file('cdf/KO/ko18.CDF', package = "faahKO"))

# 4 features
input_targetFeatTable     	<- data.frame(matrix(vector(), 4, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),stringsAsFactors=F)
input_targetFeatTable[1,] 	<- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
input_targetFeatTable[2,] 	<- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
input_targetFeatTable[3,] 	<- c("ID-3", "Cpd 3", 3420., 3454.435, 3495., 464.195358, 464.2, 464.204642)
input_targetFeatTable[4,] 	<- c("ID-4", "Cpd 4", 3670., 3701.697, 3745., 536.194638, 536.2, 536.205362)
input_targetFeatTable[,c(3:8)] <- sapply(input_targetFeatTable[,c(3:8)], as.numeric)

# FIR
input_FIR     	            <- data.frame(matrix(vector(), 4, 4, dimnames=list(c(), c("rtMin", "rtMax", "mzMin", "mzMax"))),stringsAsFactors=F)
input_FIR[1,] 	            <- c(3336.542, 3390.272, 522.1995, 522.2005)
input_FIR[2,] 	            <- c(3378.274, 3426.266, 496.1995, 496.2005)
input_FIR[3,] 	            <- c(3444.524, 3478.431, 464.1995, 464.2005)
input_FIR[4,] 	            <- c(3689.7,   3738.213, 536.1995, 536.2005)
input_FIR[,c(1:4)]          <- sapply(input_FIR[,c(1:4)], as.numeric)

# uROI (ROI are wrong, uROI are right)
input_uROI                  <- input_targetFeatTable[,c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")]
input_badtargetFeatTable    <- input_targetFeatTable
input_badtargetFeatTable[1, c("rtMin", "rtMax", "mzMin", "mzMax")] <- c(0,10000, 0,1000)
input_badtargetFeatTable[2, c("rtMin", "rtMax", "mzMin", "mzMax")] <- c(0,10000, 0,1000)
input_badtargetFeatTable[3, c("rtMin", "rtMax", "mzMin", "mzMax")] <- c(0,10000, 0,1000)
input_badtargetFeatTable[4, c("rtMin", "rtMax", "mzMin", "mzMax")] <- c(0,10000, 0,1000)

# cpdMetadata
input_cpdMetadata     <- data.frame(matrix(data=c('a','b','c','d',1,2,3,4), nrow=4, ncol=2, dimnames=list(c(),c('testcol1','testcol2')), byrow=FALSE), stringsAsFactors=FALSE)

# spectraMetadata
input_spectraMetadata <- data.frame(matrix(data=c('e','f','g',5,6,7), nrow=3, ncol=2, dimnames=list(c(),c('testcol1','testcol2')), byrow=FALSE), stringsAsFactors=FALSE)


# Expected peakTables
peakTable1     <- data.frame(matrix(vector(), 4, 15, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted", "is_filled", "ppm_error", "rt_dev_sec", "tailingFactor", "asymmetryFactor"))),stringsAsFactors=F)
peakTable1[1,] <- c(TRUE, 3309.7589296586070, 3346.8277590361445, 3385.4098874628098, 522.194778, 522.20001220703125, 522.205222, 26133726.6811244078, 889280, 901015.80529226747, FALSE, 0.023376160866574614, 1.93975903614455092, 1.0153573486330891, 1.0268238825675249)
peakTable1[2,] <- c(TRUE, 3345.3766648628907, 3386.5288072289159, 3428.2788374983961, 496.20001220703125, 496.20001220703125, 496.20001220703125, 35472141.3330242932, 1128960, 1113576.69008227298, FALSE, 0.024601030353423384, 0.95180722891564074, 1.0053782620427065, 1.0093180792278085)
peakTable1[3,] <- c(TRUE, 3451.2075903614455, 3451.5072891566265, 3501.6697504924518, 464.195358, 464.20001220703125, 464.204642, 7498427.1583901159, 380736, 389632.13549519412, FALSE, 0.026296922148575364, 2.92771084337346110, 207.6939219686769036, 380.5019028782010082)
peakTable1[4,] <- c(TRUE, 3670.9201232710743, 3704.1427831325304, 3740.0172511251831, 536.20001220703125, 536.20001220703125, 536.20001220703125, 8626279.9788195733, 330176, 326763.87246511364, FALSE, 0.022765817240815486, 2.44578313253032320, 1.0305289730128095, 1.0536948855480386)
peakTable1[,c(1,11)]       <- sapply(peakTable1[,c(1,11)], as.logical)
peakTable1[,c(2:10,12:15)] <- sapply(peakTable1[,c(2:10,12:15)], as.numeric)
# 2
peakTable2     <- data.frame(matrix(vector(), 4, 15, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted", "is_filled", "ppm_error", "rt_dev_sec", "tailingFactor", "asymmetryFactor"))),stringsAsFactors=F)
peakTable2[1,] <- c(TRUE, 3326.1063495851854, 3365.102, 3407.2726475892355, 522.194778, 522.20001220703125, 522.205222, 24545301.622835573, 761664, 790802.2209998488, FALSE, 0.023376160866574614, 20.2139999999999, 1.0339153786516375, 1.0630802030537212)
peakTable2[2,] <- c(TRUE, 3365.0238566258713, 3405.791, 3453.4049569205681, 496.195038, 496.20001220703125, 496.204962, 37207579.286265120, 1099264, 1098720.2929832144, FALSE, 0.024601030353423384, 20.2139999999999, 1.0839602450900523, 1.1717845972583161)
peakTable2[3,] <- c(TRUE, 3425.9772908380342, 3466.1733975903617, 3508.0320324994614, 464.195358, 464.20001220703125, 464.204642, 11512269.4488430563, 366720, 365928.64209905855, FALSE, 0.026296922148575364, 11.738397590361728, 1.0157024674594695, 1.0275996777323413)
peakTable2[4,] <- c(TRUE, 3678.1204484629088, 3720.347, 3768.8011145239534, 536.194638, 536.20001220703125, 536.205362, 7983406.0412310315, 220096, 229651.947643013, FALSE, 0.022765817240815486, 18.65, 1.0738577621711971, 1.1514233243540024)
peakTable2[,c(1,11)]       <- sapply(peakTable2[,c(1,11)], as.logical)
peakTable2[,c(2:10,12:15)] <- sapply(peakTable2[,c(2:10,12:15)], as.numeric)
# 3
peakTable3     <- data.frame(matrix(vector(), 4, 15, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted", "is_filled", "ppm_error", "rt_dev_sec", "tailingFactor", "asymmetryFactor"))),stringsAsFactors=F)
peakTable3[1,] <- c(TRUE, 3333.8625894557053, 3368.233, 3407.4362838927614, 522.194778, 522.20001220703125, 522.205222, 21447174.404490683, 758336, 765009.9805796633, FALSE, 0.023376160866574614, 23.345000000000255, 1.0609102044546637, 1.1155310457756928)
peakTable3[2,] <- c(TRUE, 3373.3998828113113, 3413.4952530120481, 3454.4490330927388, 496.195038, 496.20001220703125, 496.204962, 35659353.614476241, 1149440, 1145857.7611069249, FALSE, 0.024601030353423384, 27.918253012047899, 1.0081407426394933, 1.0143315197994494)
peakTable3[3,] <- c(FALSE, NA, NA, NA, NA, NA, NA, NA, NA, NA, FALSE, NA, NA, NA, NA)
peakTable3[4,] <- c(TRUE, 3672.3110625980275, 3714.088, 3761.43921706666, 536.194638, 536.20001220703125, 536.205362, 6467062.4309558524, 196160, 189416.24807174454, FALSE, 0.022765817240815486, 12.391, 1.0656000616594850, 1.1333185588985102)
peakTable3[,c(1,11)]       <- sapply(peakTable3[,c(1,11)], as.logical)
peakTable3[,c(2:10,12:15)] <- sapply(peakTable3[,c(2:10,12:15)], as.numeric)
expected_peakTables <- list(peakTable1, peakTable2, peakTable3)

# Expected peakFit
# 1
cFit1.1         <- list(amplitude=162404.8057918259, center=3341.888, sigma=0.078786133031045896, gamma=0.0018336101984172684, fitStatus=2, curveModel="skewedGaussian")
class(cFit1.1)  <- 'peakPantheR_curveFit'
cFit1.2         <- list(amplitude=199249.10572753669, center=3382.577, sigma=0.074904415304607966, gamma=0.0011471899372353885, fitStatus=2, curveModel="skewedGaussian")
class(cFit1.2)  <- 'peakPantheR_curveFit'
cFit1.3         <- list(amplitude=31645.961277502651, center=3451.435, sigma=0.064803553287811053, gamma=2.8557893789555022, fitStatus=2, curveModel="skewedGaussian")
class(cFit1.3)  <- 'peakPantheR_curveFit'
cFit1.4         <- list(amplitude=59193.591103772116, center=3698.697, sigma=0.082789238806238355, gamma=0.0026044299691057823, fitStatus=2, curveModel="skewedGaussian")
class(cFit1.4)  <- 'peakPantheR_curveFit'
# 2
cFit2.1         <- list(amplitude=124090.83425474487, center=3359.102, sigma=0.071061541060964212, gamma=0.0018336072657203239, fitStatus=2, curveModel="skewedGaussian")
class(cFit2.1)  <- 'peakPantheR_curveFit'
cFit2.2         <- list(amplitude=151407.23415130575, center=3399.791, sigma=0.063753866057052563, gamma=0.001676782834598999, fitStatus=2, curveModel="skewedGaussian")
class(cFit2.2)  <- 'peakPantheR_curveFit'
cFit2.3         <- list(amplitude=60803.292514896151, center=3460.824, sigma=0.072633009809671245, gamma=0.0015588615168115277, fitStatus=2, curveModel="skewedGaussian")
class(cFit2.3)  <- 'peakPantheR_curveFit'
cFit2.4         <- list(amplitude=31542.623023583215, center=3714.347, sigma=0.062820857630350654, gamma=0.0015366513073237947, fitStatus=2, curveModel="skewedGaussian")
class(cFit2.4)  <- 'peakPantheR_curveFit'
# 3
cFit3.1         <- list(amplitude=122363.51256736703, center=3362.233, sigma=0.075489598945304492, gamma=0.0025160536725299734, fitStatus=2, curveModel="skewedGaussian")
class(cFit3.1)  <- 'peakPantheR_curveFit'
cFit3.2         <- list(amplitude=204749.86097918145, center=3409.182, sigma=0.075731781812843249, gamma=0.0013318670577834328, fitStatus=2, curveModel="skewedGaussian")
class(cFit3.2)  <- 'peakPantheR_curveFit'
cFit3.3         <- NA
cFit3.4         <- list(amplitude=26628.505498512375, center=3708.088, sigma=0.064131129861254479, gamma=0.0015719426982490699, fitStatus=2, curveModel="skewedGaussian")
class(cFit3.4)  <- 'peakPantheR_curveFit'
expected_peakFit <- list(list(cFit1.1, cFit1.2, cFit1.3, cFit1.4), list(cFit2.1, cFit2.2, cFit2.3, cFit2.4), list(cFit3.1, cFit3.2, cFit3.3, cFit3.4))

# Expected dataPoints
tmp_raw_data1  	  <- MSnbase::readMSData(input_spectraPaths[1], centroided=TRUE, mode='onDisk')
ROIDataPoints1    <- extractSignalRawData(tmp_raw_data1, rt=input_targetFeatTable[,c('rtMin','rtMax')], mz=input_targetFeatTable[,c('mzMin','mzMax')], verbose=F)
tmp_raw_data2  	  <- MSnbase::readMSData(input_spectraPaths[2], centroided=TRUE, mode='onDisk')
ROIDataPoints2    <- extractSignalRawData(tmp_raw_data2, rt=input_targetFeatTable[,c('rtMin','rtMax')], mz=input_targetFeatTable[,c('mzMin','mzMax')], verbose=F)
tmp_raw_data3  	  <- MSnbase::readMSData(input_spectraPaths[3], centroided=TRUE, mode='onDisk')
ROIDataPoints3    <- extractSignalRawData(tmp_raw_data3, rt=input_targetFeatTable[,c('rtMin','rtMax')], mz=input_targetFeatTable[,c('mzMin','mzMax')], verbose=F)
expected_dataPoints <- list(ROIDataPoints1, ROIDataPoints2, ROIDataPoints3)


test_that('3 files, 4 compounds, no uROI, no FIR, no getAcquTime, no verbose', {
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)

  # Expected annotation
  expected_annotation             <- initAnnotation
  expected_annotation@TIC         <- c(2410533091, 2524040155, 2332817115)
  expected_annotation@peakTables  <- expected_peakTables
  expected_annotation@peakFit     <- expected_peakFit
  expected_annotation@dataPoints  <- expected_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- NA
  names(tmp_status)   <- 'test'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n")

	# results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=FALSE, verbose=FALSE))

  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation, tolerance=1e-5)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)

  # Check messages (centwave output)
  expect_equal(length(result_parallelAnnotation$messages), 3)
  expect_equal(result_parallelAnnotation$messages, expected_message)
})

test_that('3 files (1 missing), 4 compounds, no uROI, no FIR, no getAcquTime, no verbose', {
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_missingSpectraPaths, targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)

  # Expected annotation
  expected_annotation             <- initAnnotation[c(1,3),]
  expected_annotation@TIC         <- c(2410533091, 2332817115)
  expected_annotation@peakTables  <- expected_peakTables[c(1,3)]
  expected_annotation@peakFit     <- expected_peakFit[c(1,3)]
  expected_annotation@dataPoints  <- expected_dataPoints[c(1,3)]
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- 'Error file does not exist: aaa/bbb.cdf'
  names(tmp_status)   <- 'aaa/bbb.cdf'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n")

  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=FALSE, verbose=FALSE))

  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)

  # Check messages (centwave output)
  expect_equal(length(result_parallelAnnotation$messages), 2)
  expect_equal(result_parallelAnnotation$messages, expected_message)
})

test_that('3 files, 4 compounds, no uROI, no FIR, no getAcquTime, no verbose, modify parameter with ... (cpd #3)', {
  # Cpd 3 is now found in 3rd file
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)

  # Modify fit of window #3
  tmp_params              <- list(init_params  = list(amplitude=1E5, center=3455., sigma=0.1, gamma=0),
                                  lower_bounds = list(amplitude=0,   center=3450., sigma=0,   gamma=-0.1),
                                  upper_bounds = list(amplitude=1E9, center=3460., sigma=5,   gamma=0.1))
  new_params              <- list('guess', 'guess', tmp_params, 'guess')
  
  # Expected annotation
  expected_annotation             <- initAnnotation
  expected_annotation@TIC         <- c(2410533091, 2524040155, 2332817115)
  # modify peakTable
  tmp_peakTable1                  <- expected_peakTables[[1]]
  tmp_peakTable1[3,c(2:10,12:15)] <- c(3418.0076795585401, 3455.6277710843374, 3495.4734240188186, 464.195358, 464.2000122, 464.204642, 11307215.264967661, 380736, 381327.26552768378, 0.026296922148575364, 1.1927710843374371, 1.0223856861398346, 1.0391667928715738)
  tmp_peakTable2                  <- expected_peakTables[[2]]
  tmp_peakTable2[3,c(2:10,12:15)] <- c(3433.0520428402692, 3464.1974939759039, 3518.3673814020449, 464.195358, 464.2000122, 464.204642, 11632481.39997852, 366720, 370275.43095360085, 0.026296922148575364, 9.762493975903908, 1.3108566292516153, 1.566712445298531)
  tmp_peakTable3                  <- expected_peakTables[[3]]
  tmp_peakTable3[3,c(2:10,12:15)] <- c(3428.5236305028589, 3459.5514216867468, 3510.3107983995801, 464.195358, 464.2000122, 464.204642, 9697604.1795769241, 319488, 321005.94361925457, 0.026296922148575364, 5.1164216867468895, 1.2652077714541707, 1.4814479150398188)
  tmp_peakTable3$found[3]         <- TRUE
  expected_annotation@peakTables  <- list(tmp_peakTable1, tmp_peakTable2, tmp_peakTable3)
  # modify curveFit
  tmp_curveFit1.3         <- list(amplitude=64246.052173667762, center=3450, sigma=0.07533469863886906, gamma=0.0019238229766131536, fitStatus=2, curveModel="skewedGaussian")
  class(tmp_curveFit1.3)  <- 'peakPantheR_curveFit'
  tmp_curveFit2.3         <- list(amplitude=31499.356902732343, center=3454.217764223421, sigma=0.052005180846722628, gamma=0.0030181085286239786, fitStatus=1, curveModel="skewedGaussian")
  class(tmp_curveFit2.3)  <- 'peakPantheR_curveFit'
  tmp_curveFit3.3         <- list(amplitude=29842.598057228814, center=3450, sigma=0.055439446898995937, gamma=0.0031338189157350213, fitStatus=2, curveModel="skewedGaussian")
  class(tmp_curveFit3.3)  <- 'peakPantheR_curveFit'
  expected_annotation@peakFit           <- expected_peakFit
  expected_annotation@peakFit[[1]][[3]] <- tmp_curveFit1.3
  expected_annotation@peakFit[[2]][[3]] <- tmp_curveFit2.3
  expected_annotation@peakFit[[3]][[3]] <- tmp_curveFit3.3
  expected_annotation@dataPoints  <- expected_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- NA
  names(tmp_status)   <- 'test'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n")

  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=FALSE, verbose=FALSE, params=new_params))

  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation, tolerance=1e-5)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)

  # Check messages (centwave output)
  expect_equal(length(result_parallelAnnotation$messages), 3)
  expect_equal(result_parallelAnnotation$messages, expected_message)
})

test_that('3 files, 4 compounds, no uROI, no FIR, no getAcquTime, no verbose, peaks not found and not replaced (cpd #3)', {
  # Cpd #3 will not give results
  noMatch_ROI3        <- input_targetFeatTable
  noMatch_ROI3[3,6:8] <- c(52.194778, 52.2, 52.205222)
  
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=noMatch_ROI3, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)
  
  # Expected annotation
  expected_annotation             <- initAnnotation
  expected_annotation@TIC         <- c(2410533091, 2524040155, 2332817115)
  tmp_peakTables                        <- expected_peakTables
  tmp_peakTables[[1]][3,c(2:10,12:15)]  <- as.numeric(NA)
  tmp_peakTables[[1]]$found[3]          <- FALSE
  tmp_peakTables[[2]][3,c(2:10,12:15)]  <- as.numeric(NA)
  tmp_peakTables[[2]]$found[3]          <- FALSE
  tmp_peakTables[[3]][3,c(2:10,12:15)]  <- as.numeric(NA)
  tmp_peakTables[[3]]$found[3]          <- FALSE
  expected_annotation@peakTables        <- tmp_peakTables
  tmp_peakFit                     <- expected_peakFit
  tmp_peakFit[[1]][[3]]           <- NA
  tmp_peakFit[[2]][[3]]           <- NA
  tmp_peakFit[[3]][[3]]           <- NA
  expected_annotation@peakFit     <- tmp_peakFit
  tmp_dataPoints                  <- expected_dataPoints
  tmp_dataPoints[[1]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  tmp_dataPoints[[2]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  tmp_dataPoints[[3]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  expected_annotation@dataPoints  <- tmp_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- NA
  names(tmp_status)   <- 'test'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n")
  
  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=FALSE, verbose=FALSE))
  
  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation, tolerance=1e-5)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)
  
  # Check messages (centwave output)
  expect_equal(length(result_parallelAnnotation$messages), 3)
  expect_equal(result_parallelAnnotation$messages, expected_message)
})

test_that('3 files, 4 compounds, no uROI, FIR replace peaks not found (cpd #3), no getAcquTime, no verbose', {
  # Cpd #3 will not give results, FIR will replace
  noMatch_ROI3        <- input_targetFeatTable
  noMatch_ROI3[3,6:8] <- c(52.194778, 52.2, 52.205222)
  
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=noMatch_ROI3, useFIR=TRUE, FIR=input_FIR, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)
  
  # Expected annotation
  expected_annotation             <- initAnnotation
  expected_annotation@TIC         <- c(2410533091, 2524040155, 2332817115)
  tmp_peakTables                        <- expected_peakTables
  tmp_peakTables[[1]][3,c(2:10,12:15)]  <- c(3444.524, 3454.435, 3478.431, 464.1995, 464.20001220703125, 464.2005, 8801660.3810909167, 380736, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[1]]$is_filled[3]      <- TRUE
  tmp_peakTables[[2]][3,c(2:10,12:15)]  <- c(3444.524, 3463.824, 3478.431, 464.1995, 464.20001220703125, 464.2005, 8675223.6101818271, 366720, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[2]]$is_filled[3]      <- TRUE
  tmp_peakTables[[3]][3,c(2:10,12:15)]  <- c(3444.524, 3460.696, 3478.431, 464.1995, 464.20001220703125, 464.2005, 6564791.4560000831, 319488, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[3]]$found[3]      <- TRUE
  tmp_peakTables[[3]]$is_filled[3]      <- TRUE
  expected_annotation@peakTables        <- tmp_peakTables
  tmp_peakFit                     <- expected_peakFit
  tmp_peakFit[[1]][[3]]           <- NA
  tmp_peakFit[[2]][[3]]           <- NA
  tmp_peakFit[[3]][[3]]           <- NA
  expected_annotation@peakFit     <- tmp_peakFit
  tmp_dataPoints                  <- expected_dataPoints
  tmp_dataPoints[[1]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  tmp_dataPoints[[2]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  tmp_dataPoints[[3]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  expected_annotation@dataPoints  <- tmp_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- NA
  names(tmp_status)   <- 'test'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n")
  
  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=FALSE, verbose=FALSE))
  
  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation, tolerance=1e-5)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)
  
  # Check messages (centwave output)
  expect_equal(length(result_parallelAnnotation$messages), 3)
  expect_equal(result_parallelAnnotation$messages, expected_message)
})

test_that('3 files, 4 compounds, uROI, no FIR, no fitGauss, no getAcquTime, no verbose', {
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_badtargetFeatTable, uROIExist=TRUE, useUROI=TRUE, uROI=input_uROI, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)

  # Expected annotation
  expected_annotation             <- initAnnotation
  expected_annotation@TIC         <- c(2410533091, 2524040155, 2332817115)
  expected_annotation@peakTables  <- expected_peakTables
  expected_annotation@peakFit     <- expected_peakFit
  expected_annotation@dataPoints  <- expected_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- NA
  names(tmp_status)   <- 'test'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n")

  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=FALSE, verbose=FALSE))

  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation, tolerance=1e-5)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)

  # Check messages (centwave output)
  expect_equal(length(result_parallelAnnotation$messages), 3)
  expect_equal(result_parallelAnnotation$messages, expected_message)
})

test_that('serial: 3 files, (1 missing), 4 compounds, uROI, FIR replace peaks not found (cpd #3), getAcquTime, verbose', {
  # sample 2 is missing
  # Cpd #3 will not give results
  noMatch_uROI3        <- input_uROI
  noMatch_uROI3[3,4:6] <- c(52.194778, 52.2, 52.205222)
  
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_missingSpectraPaths, targetFeatTable=input_badtargetFeatTable, uROIExist=TRUE, useUROI=TRUE, uROI=noMatch_uROI3, useFIR=TRUE, FIR=input_FIR, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)

  # Expected annotation
  expected_annotation             <- initAnnotation[c(1,3),]
  expected_annotation@TIC         <- c(2410533091, 2332817115)
  tmp_peakTables                        <- expected_peakTables[c(1,3)]
  tmp_peakTables[[1]][3,c(2:10,12:15)]  <- c(3444.524, 3454.435, 3478.431, 464.1995, 464.20001220703125, 464.2005, 8801660.3810909167, 380736, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[1]]$is_filled[3]      <- TRUE
  tmp_peakTables[[2]][3,c(2:10,12:15)]  <- c(3444.524, 3460.696, 3478.431, 464.1995, 464.20001220703125, 464.2005, 6564791.4560000831, 319488, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[2]]$found[3]          <- TRUE
  tmp_peakTables[[2]]$is_filled[3]      <- TRUE
  expected_annotation@peakTables        <- tmp_peakTables
  tmp_peakFit                     <- expected_peakFit[c(1,3)]
  tmp_peakFit[[1]][[3]]           <- NA
  tmp_peakFit[[2]][[3]]           <- NA
  expected_annotation@peakFit     <- tmp_peakFit
  tmp_dataPoints                  <- expected_dataPoints[c(1,3)]
  tmp_dataPoints[[1]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  tmp_dataPoints[[2]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  expected_annotation@dataPoints  <- tmp_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- 'Error file does not exist: aaa/bbb.cdf'
  names(tmp_status)   <- 'aaa/bbb.cdf'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Processing 4 compounds in 3 samples:\n", "  uROI:\tTRUE\n", "  FIR:\tTRUE\n", "----- ko15 -----\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Check input, mzMLPath must be a .mzML\n", "Reading data from 4 windows\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Fit of ROI #3 is unsuccessful (try error)\n", "1 features to integrate with FIR\n", "Reading data from 1 windows\n", "Error file does not exist: aaa/bbb.cdf\n", "----- ko18 -----\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Check input, mzMLPath must be a .mzML\n", "Reading data from 4 windows\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #2\n", "Fit of ROI #3 is unsuccessful (try error)\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #4\n", "1 features to integrate with FIR\n", "Reading data from 1 windows\n", "----------------\n", "1 file(s) failed to process:\n          file                                  error\n1 aaa/bbb.cdf Error file does not exist: aaa/bbb.cdf\n", "Annotation object cannot be reordered by sample acquisition date\n", "----------------\n", "  1 failure(s)\n")

  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=TRUE, verbose=TRUE))

  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)

  # Check messages (no timing)
  expect_equal(length(result_parallelAnnotation$messages), 40)
  expect_equal(result_parallelAnnotation$messages[c(1:7,9,10,13,14,18:22,24:27,30,31,35,36,37,38,40)], expected_message)
})

test_that('parallel (with cluster reset): 3 files, (1 missing), 4 compounds, uROI, FIR replace peaks not found (cpd #3), getAcquTime, verbose', {
  # sample 2 is missing
  # Cpd #3 will not give results
  noMatch_uROI3        <- input_uROI
  noMatch_uROI3[3,4:6] <- c(52.194778, 52.2, 52.205222)
  
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_missingSpectraPaths, targetFeatTable=input_badtargetFeatTable, uROIExist=TRUE, useUROI=TRUE, uROI=noMatch_uROI3, useFIR=TRUE, FIR=input_FIR, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)
  
  # Expected annotation
  expected_annotation             <- initAnnotation[c(1,3),]
  expected_annotation@TIC         <- c(2410533091, 2332817115)
  tmp_peakTables                        <- expected_peakTables[c(1,3)]
  tmp_peakTables[[1]][3,c(2:10,12:15)]  <- c(3444.524, 3454.435, 3478.431, 464.1995, 464.20001220703125, 464.2005, 8801660.3810909167, 380736, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[1]]$is_filled[3]      <- TRUE
  tmp_peakTables[[2]][3,c(2:10,12:15)]  <- c(3444.524, 3460.696, 3478.431, 464.1995, 464.20001220703125, 464.2005, 6564791.4560000831, 319488, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[2]]$found[3]          <- TRUE
  tmp_peakTables[[2]]$is_filled[3]      <- TRUE
  expected_annotation@peakTables        <- tmp_peakTables
  tmp_peakFit                     <- expected_peakFit[c(1,3)]
  tmp_peakFit[[1]][[3]]           <- NA
  tmp_peakFit[[2]][[3]]           <- NA
  expected_annotation@peakFit     <- tmp_peakFit
  tmp_dataPoints                  <- expected_dataPoints[c(1,3)]
  tmp_dataPoints[[1]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  tmp_dataPoints[[2]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  expected_annotation@dataPoints  <- tmp_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- 'Error file does not exist: aaa/bbb.cdf'
  names(tmp_status)   <- 'aaa/bbb.cdf'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Processing 4 compounds in 3 samples:\n", "  uROI:\tTRUE\n", "  FIR:\tTRUE\n", "Running 3 clusters of 1 files over 1 cores:\n", "  starting cluster 1/3\n", "  starting cluster 2/3\n", "  starting cluster 3/3\n", "----------------\n", "1 file(s) failed to process:\n          file                                  error\n1 aaa/bbb.cdf Error file does not exist: aaa/bbb.cdf\n", "Annotation object cannot be reordered by sample acquisition date\n", "----------------\n", "  1 failure(s)\n")
  
  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=1, getAcquTime=TRUE, resetWorkers=1, verbose=TRUE))
  
  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)
  
  # Check messages (no timing)
  expect_equal(length(result_parallelAnnotation$messages), 13)
  expect_equal(result_parallelAnnotation$messages[c(1:11,13)], expected_message)
})

test_that('parallel (without cluster reset): 3 files, (1 missing), 4 compounds, uROI, FIR replace peaks not found (cpd #3), getAcquTime, verbose', {
  # sample 2 is missing
  # Cpd #3 will not give results
  noMatch_uROI3        <- input_uROI
  noMatch_uROI3[3,4:6] <- c(52.194778, 52.2, 52.205222)
  
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_missingSpectraPaths, targetFeatTable=input_badtargetFeatTable, uROIExist=TRUE, useUROI=TRUE, uROI=noMatch_uROI3, useFIR=TRUE, FIR=input_FIR, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)
  
  # Expected annotation
  expected_annotation             <- initAnnotation[c(1,3),]
  expected_annotation@TIC         <- c(2410533091, 2332817115)
  tmp_peakTables                        <- expected_peakTables[c(1,3)]
  tmp_peakTables[[1]][3,c(2:10,12:15)]  <- c(3444.524, 3454.435, 3478.431, 464.1995, 464.20001220703125, 464.2005, 8801660.3810909167, 380736, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[1]]$is_filled[3]      <- TRUE
  tmp_peakTables[[2]][3,c(2:10,12:15)]  <- c(3444.524, 3460.696, 3478.431, 464.1995, 464.20001220703125, 464.2005, 6564791.4560000831, 319488, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[2]]$found[3]          <- TRUE
  tmp_peakTables[[2]]$is_filled[3]      <- TRUE
  expected_annotation@peakTables        <- tmp_peakTables
  tmp_peakFit                     <- expected_peakFit[c(1,3)]
  tmp_peakFit[[1]][[3]]           <- NA
  tmp_peakFit[[2]][[3]]           <- NA
  expected_annotation@peakFit     <- tmp_peakFit
  tmp_dataPoints                  <- expected_dataPoints[c(1,3)]
  tmp_dataPoints[[1]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  tmp_dataPoints[[2]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  expected_annotation@dataPoints  <- tmp_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- 'Error file does not exist: aaa/bbb.cdf'
  names(tmp_status)   <- 'aaa/bbb.cdf'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Processing 4 compounds in 3 samples:\n", "  uROI:\tTRUE\n", "  FIR:\tTRUE\n",  "----------------\n", "1 file(s) failed to process:\n          file                                  error\n1 aaa/bbb.cdf Error file does not exist: aaa/bbb.cdf\n", "Annotation object cannot be reordered by sample acquisition date\n", "----------------\n", "  1 failure(s)\n")
  
  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=1, getAcquTime=TRUE, resetWorkers=0, verbose=TRUE))
  
  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)
  
  # Check messages (no timing)
  expect_equal(length(result_parallelAnnotation$messages), 9)
  expect_equal(result_parallelAnnotation$messages[c(1:7,9)], expected_message)
})

test_that('serial and parallel (with cluster reset) give the same result: 3 files, (1 missing), 4 compounds, uROI, FIR replace peaks not found (cpd #3), getAcquTime, verbose', {
  # sample 2 is missing
  # Cpd #3 will not give results
  noMatch_uROI3        <- input_uROI
  noMatch_uROI3[3,4:6] <- c(52.194778, 52.2, 52.205222)
  
  # Object fully initialised
  initAnnotation  <- peakPantheRAnnotation(spectraPaths=input_missingSpectraPaths, targetFeatTable=input_badtargetFeatTable, uROIExist=TRUE, useUROI=TRUE, uROI=noMatch_uROI3, useFIR=TRUE, FIR=input_FIR, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)

  # results
  result_serial   <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=TRUE, verbose=TRUE))
  result_parallel <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=1, getAcquTime=TRUE, resetWorkers=1, verbose=TRUE))

  # Check results
  expect_equal(result_serial$result, result_parallel$result)
})

test_that('serial and parallel (without cluster reset) give the same result: 3 files, (1 missing), 4 compounds, uROI, FIR replace peaks not found (cpd #3), getAcquTime, verbose', {
  # sample 2 is missing
  # Cpd #3 will not give results
  noMatch_uROI3        <- input_uROI
  noMatch_uROI3[3,4:6] <- c(52.194778, 52.2, 52.205222)
  
  # Object fully initialised
  initAnnotation  <- peakPantheRAnnotation(spectraPaths=input_missingSpectraPaths, targetFeatTable=input_badtargetFeatTable, uROIExist=TRUE, useUROI=TRUE, uROI=noMatch_uROI3, useFIR=TRUE, FIR=input_FIR, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)
  
  # results
  result_serial   <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=TRUE, verbose=TRUE))
  result_parallel <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=1, getAcquTime=TRUE, resetWorkers=0, verbose=TRUE))
  
  # Check results
  expect_equal(result_serial$result, result_parallel$result)
})

test_that('change to resetWorkers alters the number of parallel cluster reset', {
  # sample 2 is missing
  # Cpd #3 will not give results
  noMatch_uROI3        <- input_uROI
  noMatch_uROI3[3,4:6] <- c(52.194778, 52.2, 52.205222)
  
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_missingSpectraPaths, targetFeatTable=input_badtargetFeatTable, uROIExist=TRUE, useUROI=TRUE, uROI=noMatch_uROI3, useFIR=TRUE, FIR=input_FIR, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)
  
  # Expected annotation
  expected_annotation             <- initAnnotation[c(1,3),]
  expected_annotation@TIC         <- c(2410533091, 2332817115)
  tmp_peakTables                        <- expected_peakTables[c(1,3)]
  tmp_peakTables[[1]][3,c(2:10,12:15)]  <- c(3444.524, 3454.435, 3478.431, 464.1995, 464.20001220703125, 464.2005, 8801660.3810909167, 380736, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[1]]$is_filled[3]      <- TRUE
  tmp_peakTables[[2]][3,c(2:10,12:15)]  <- c(3444.524, 3460.696, 3478.431, 464.1995, 464.20001220703125, 464.2005, 6564791.4560000831, 319488, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[2]]$found[3]          <- TRUE
  tmp_peakTables[[2]]$is_filled[3]      <- TRUE
  expected_annotation@peakTables        <- tmp_peakTables
  tmp_peakFit                     <- expected_peakFit[c(1,3)]
  tmp_peakFit[[1]][[3]]           <- NA
  tmp_peakFit[[2]][[3]]           <- NA
  expected_annotation@peakFit     <- tmp_peakFit
  tmp_dataPoints                  <- expected_dataPoints[c(1,3)]
  tmp_dataPoints[[1]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  tmp_dataPoints[[2]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  expected_annotation@dataPoints  <- tmp_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- 'Error file does not exist: aaa/bbb.cdf'
  names(tmp_status)   <- 'aaa/bbb.cdf'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("Processing 4 compounds in 3 samples:\n", "  uROI:\tTRUE\n", "  FIR:\tTRUE\n", "Running 2 clusters of 2 files over 1 cores:\n", "  starting cluster 1/2\n", "  starting cluster 2/2\n", "----------------\n", "1 file(s) failed to process:\n          file                                  error\n1 aaa/bbb.cdf Error file does not exist: aaa/bbb.cdf\n", "Annotation object cannot be reordered by sample acquisition date\n", "----------------\n", "  1 failure(s)\n")
  
  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=1, getAcquTime=TRUE, resetWorkers=2, verbose=TRUE))
  
  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)
  
  # Check messages (no timing)
  expect_equal(length(result_parallelAnnotation$messages), 12)
  expect_equal(result_parallelAnnotation$messages[c(1:10,12)], expected_message)
})

test_that('already annotated message in verbose', {
  # use "serial: 3 files, (1 missing), 4 compounds, uROI, FIR replace peaks not found (cpd #3), getAcquTime, verbose"
  
  # sample 2 is missing
  # Cpd #3 will not give results
  noMatch_uROI3        <- input_uROI
  noMatch_uROI3[3,4:6] <- c(52.194778, 52.2, 52.205222)
  
  # Object fully initialised
  initAnnotation      <- peakPantheRAnnotation(spectraPaths=input_missingSpectraPaths, targetFeatTable=input_badtargetFeatTable, uROIExist=TRUE, useUROI=TRUE, uROI=noMatch_uROI3, useFIR=TRUE, FIR=input_FIR, isAnnotated=TRUE, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)
  
  # Expected annotation
  expected_annotation             <- initAnnotation[c(1,3),]
  expected_annotation@TIC         <- c(2410533091, 2332817115)
  tmp_peakTables                        <- expected_peakTables[c(1,3)]
  tmp_peakTables[[1]][3,c(2:10,12:15)]  <- c(3444.524, 3454.435, 3478.431, 464.1995, 464.20001220703125, 464.2005, 8801660.3810909167, 380736, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[1]]$is_filled[3]      <- TRUE
  tmp_peakTables[[2]][3,c(2:10,12:15)]  <- c(3444.524, 3460.696, 3478.431, 464.1995, 464.20001220703125, 464.2005, 6564791.4560000831, 319488, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  tmp_peakTables[[2]]$found[3]          <- TRUE
  tmp_peakTables[[2]]$is_filled[3]      <- TRUE
  expected_annotation@peakTables        <- tmp_peakTables
  tmp_peakFit                     <- expected_peakFit[c(1,3)]
  tmp_peakFit[[1]][[3]]           <- NA
  tmp_peakFit[[2]][[3]]           <- NA
  expected_annotation@peakFit     <- tmp_peakFit
  tmp_dataPoints                  <- expected_dataPoints[c(1,3)]
  tmp_dataPoints[[1]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  tmp_dataPoints[[2]][[3]]        <- data.frame(rt=numeric(), mz=numeric(), int=numeric())
  expected_annotation@dataPoints  <- tmp_dataPoints
  expected_annotation@isAnnotated <- TRUE
  # Expected failures
  tmp_status          <- 'Error file does not exist: aaa/bbb.cdf'
  names(tmp_status)   <- 'aaa/bbb.cdf'
  tmp_failures        <- !is.na(tmp_status)
  names(tmp_failures) <- NULL
  expected_failures   <- data.frame(matrix(c(names(tmp_status)[tmp_failures], tmp_status[tmp_failures]), ncol=2, byrow=FALSE, dimnames=list(c(), c('file', 'error'))), stringsAsFactors=FALSE)
  # Expected message
  expected_message    <- c("!! Data was already annotated, results will be overwritten !!\n", "Processing 4 compounds in 3 samples:\n", "  uROI:\tTRUE\n", "  FIR:\tTRUE\n", "----- ko15 -----\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Check input, mzMLPath must be a .mzML\n", "Reading data from 4 windows\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Fit of ROI #3 is unsuccessful (try error)\n", "1 features to integrate with FIR\n", "Reading data from 1 windows\n", "Error file does not exist: aaa/bbb.cdf\n", "----- ko18 -----\n", "Polarity can not be extracted from netCDF files, please set manually the polarity with the 'polarity' method.\n", "Check input, mzMLPath must be a .mzML\n", "Reading data from 4 windows\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #2\n", "Fit of ROI #3 is unsuccessful (try error)\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #4\n", "1 features to integrate with FIR\n", "Reading data from 1 windows\n", "----------------\n", "1 file(s) failed to process:\n          file                                  error\n1 aaa/bbb.cdf Error file does not exist: aaa/bbb.cdf\n", "Annotation object cannot be reordered by sample acquisition date\n", "----------------\n", "  1 failure(s)\n")
  
  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=TRUE, verbose=TRUE))
  
  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation)
  expect_equal(result_parallelAnnotation$result$failures, expected_failures)
  
  # Check messages (no timing)
  expect_equal(length(result_parallelAnnotation$messages), 41)
  expect_equal(result_parallelAnnotation$messages[c(1:8,10,11,14,15,19:23,25:28,31,32,36,37,38,39,41)], expected_message)
})

test_that('catch file that doesnt exist, catch error processing, no file left', {
  # Object fully initialised
  wrongPaths      <- c("aaa/bbb.cdf", system.file("testdata/test_fakemzML.mzML", package = "peakPantheR"))
  initAnnotation  <- peakPantheRAnnotation(spectraPaths=wrongPaths, targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata, spectraMetadata=input_spectraMetadata)

  # Expected annotation
  expected_annotation             <- initAnnotation[c(FALSE, FALSE),]
  expected_annotation@isAnnotated <- FALSE
  # Expected message
  expected_message    <- c("Processing 4 compounds in 2 samples:\n", "  uROI:\tFALSE\n", "  FIR:\tFALSE\n", "Error file does not exist: aaa/bbb.cdf\n", "----- test_fakemzML -----\n", "-----\n", "Error processing file: test_fakemzML\n", "\n-----\n", "----------------\n", "No file left in the object!\n", "Annotation object reordered by sample acquisition date\n", "----------------\n", "  2 failure(s)\n")

  # results (output, warnings and messages)
  result_parallelAnnotation <- evaluate_promise(peakPantheR_parallelAnnotation(initAnnotation, ncores=0, getAcquTime=FALSE, verbose=TRUE))

  # Check results
  expect_equal(result_parallelAnnotation$result$annotation, expected_annotation)
  # cannot check the failure paths
  expect_equal(dim(result_parallelAnnotation$result$failures)[1], 2)
  expect_equal(dim(result_parallelAnnotation$result$failures)[2], 2)

  # Check messages (remove timing and paths in error messages)
  expect_equal(length(result_parallelAnnotation$messages), 16)
  expect_equal(result_parallelAnnotation$messages[c(1:7, 9, 10, 12, 13, 14, 16)], expected_message)
})

test_that('raise errors', {
  # Object fails validation on input check
  wrongInit       <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable)
  wrongInit@TIC   <- c(1, 2)
  msg1            <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: TIC has 2 elements (samples). Should be 3', sep='')
  expect_error(peakPantheR_parallelAnnotation(wrongInit, ncores=0, getAcquTime=FALSE, verbose=FALSE), msg1, fixed=TRUE)

  # resetWorkers is not an integer
  initAnnotation2 <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable)
  msg2            <- "Check input, resetWorkers must be an integer"
  expect_error(peakPantheR_parallelAnnotation(initAnnotation2, ncores=0, getAcquTime=FALSE, resetWorkers='not an Integer', verbose=FALSE), msg2, fixed=TRUE)
  
  # resetWorkers is < 0
  initAnnotation3 <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable)
  msg3            <- "Check input, resetWorkers must be a positive integer"
  expect_error(peakPantheR_parallelAnnotation(initAnnotation3, ncores=0, getAcquTime=FALSE, resetWorkers=-10, verbose=FALSE), msg3, fixed=TRUE)
})
