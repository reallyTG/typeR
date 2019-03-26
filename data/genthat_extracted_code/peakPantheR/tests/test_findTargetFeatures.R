context('findTargetFeatures()')

skip_if(getRversion() >= "3.6")
skip_if_not_installed('faahKO',  minimum_version = '1.18.0')
library(faahKO)


## Input and expected data
# use ko15.CDf file from the pkg faahKO
singleSpectraDataPath <- system.file('cdf/KO/ko15.CDF', package = "faahKO")
raw_data  						<- MSnbase::readMSData(singleSpectraDataPath, centroided=TRUE, mode='onDisk')

# targeted features in faahKO
input_ROI     	<- data.frame(matrix(vector(), 4, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),stringsAsFactors=F)
input_ROI[1,] 	<- c("ID-1", "testCpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
input_ROI[2,] 	<- c("ID-2", "testCpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
input_ROI[3,] 	<- c("ID-3", "testCpd 3", 3420., 3454.435, 3495., 464.195358, 464.2, 464.204642)
input_ROI[4,] 	<- c("ID-4", "testCpd 4", 3670., 3701.697, 3745., 536.194638, 536.2, 536.205362)
input_ROI[,3:8] <- sapply(input_ROI[,3:8], as.numeric)

# ROIDataPoints for each window
input_ROIsDataPoints <- extractSignalRawData(raw_data, rt=input_ROI[,c('rtMin','rtMax')], mz=input_ROI[,c('mzMin','mzMax')], verbose=F)

# found peaks
found_peakTable     <- data.frame(matrix(vector(), 4, 10, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted"))),stringsAsFactors=F)
found_peakTable[1,] <- c(TRUE, 3309.7589296586070, 3346.8277590361445, 3385.4098874628098, 522.194778, 522.20001220703125, 522.205222, 26133726.6811244078, 889280, 901015.80529226747)
found_peakTable[2,] <- c(TRUE, 3345.3766648628907, 3386.5288072289159, 3428.2788374983961, 496.20001220703125, 496.20001220703125, 496.20001220703125, 35472141.3330242932, 1128960, 1113576.69008227298)
found_peakTable[3,] <- c(TRUE, 3451.2075903614455, 3451.5072891566265, 3501.6697504924518, 464.195358, 464.20001220703125, 464.204642, 7498427.1583901159, 380736, 389632.13549519412)
found_peakTable[4,] <- c(TRUE, 3670.9201232710743, 3704.1427831325304, 3740.0172511251831, 536.20001220703125, 536.20001220703125, 536.20001220703125, 8626279.9788195733, 330176, 326763.87246511364)
found_peakTable[,1] <- sapply(found_peakTable[,c(1)], as.logical)

cFit1           <- list(amplitude=162404.8057918259, center=3341.888, sigma=0.078786133031045896, gamma=0.0018336101984172684, fitStatus=2, curveModel="skewedGaussian")
class(cFit1)    <- 'peakPantheR_curveFit'
cFit2           <- list(amplitude=199249.10572753669, center=3382.577, sigma=0.074904415304607966, gamma=0.0011471899372353885, fitStatus=2, curveModel="skewedGaussian")
class(cFit2)    <- 'peakPantheR_curveFit'
cFit3           <- list(amplitude=31645.961277502651, center=3451.435, sigma=0.064803553287811053, gamma=2.8557893789555022, fitStatus=2, curveModel="skewedGaussian")
class(cFit3)    <- 'peakPantheR_curveFit'
cFit4           <- list(amplitude=59193.591103772116, center=3698.697, sigma=0.082789238806238355, gamma=0.0026044299691057823, fitStatus=2, curveModel="skewedGaussian")
class(cFit4)    <- 'peakPantheR_curveFit'
found_curveFit  <- list(cFit1, cFit2, cFit3, cFit4)

foundPeaks <- list(peakTable=found_peakTable, curveFit=found_curveFit)


test_that('default parameters, skewedGaussian, guess params, sampling 250, no verbose', {
  # expected foundPeaks
  expected_foundPeaks <- foundPeaks
  
	# results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(input_ROIsDataPoints, input_ROI, curveModel='skewedGaussian', params='guess', sampling=250, verbose=FALSE))

  # Check result table
  expect_equal(result_foundPeaks$result, expected_foundPeaks)

  # Check result messages
  expect_equal(length(result_foundPeaks$messages), 0)
})

test_that('trigger fitCurve TryCatch, with verbose', {
  # no scans in window #3
  tmpDPoints          <- input_ROIsDataPoints
  tmpDPoints[[3]]     <- extractSignalRawData(raw_data, rt=c(3454.435, 3454.435), mz=c(464.2, 464.2), verbose=F)[[1]]
  
  # expected foundPeaks
  expected_foundPeaks               <- foundPeaks
  expected_foundPeaks$peakTable[3,] <- c(FALSE, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  expected_foundPeaks$peakTable[,1] <- as.logical(expected_foundPeaks$peakTable[,1])
  expected_foundPeaks$curveFit[[3]] <- NA
  
  # expected messages
  expected_messages <- c("Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Fit of ROI #3 is unsuccessful (try error)\n")
    
  # results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(tmpDPoints, input_ROI, curveModel='skewedGaussian', params='guess', sampling=250, verbose=TRUE))
  
  # Check result table
  expect_equal(result_foundPeaks$result, expected_foundPeaks)
  
  # Check result messages (no timing)
  expect_equal(length(result_foundPeaks$messages), 3)
  expect_equal(result_foundPeaks$messages[1:2], expected_messages)
})

test_that('failed fit (fitCurve status 0/5/-1), with verbose', {
  # no scans in window #3
  tmpDPoints          <- input_ROIsDataPoints
  tmpDPoints[[3]]     <- extractSignalRawData(raw_data, rt=c(3454., 3455.), mz=c(464.195358, 464.204642), verbose=F)[[1]]
  
  # expected foundPeaks
  expected_foundPeaks               <- foundPeaks
  expected_foundPeaks$peakTable[3,] <- c(FALSE, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  expected_foundPeaks$peakTable[,1] <- as.logical(expected_foundPeaks$peakTable[,1])
  expected_foundPeaks$curveFit[[3]] <- NA
  
  # expected messages
  expected_messages <- c("Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Fit of ROI #3 is unsuccessful (fit status)\n")
  
  # results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(tmpDPoints, input_ROI, curveModel='skewedGaussian', params='guess', sampling=250, verbose=TRUE))
  
  # Check result table
  expect_equal(result_foundPeaks$result, expected_foundPeaks)
  
  # Check result messages (no timing)
  expect_equal(length(result_foundPeaks$messages), 3)
  expect_equal(result_foundPeaks$messages[1:2], expected_messages)
})

test_that('mzMin mzMax cannot be calculated due to rtMin (#3) rtMax (#4) outside of ROI, verbose', {
  # expected foundPeaks
  expected_foundPeaks <- foundPeaks
  # expected messages
  expected_messages   <- c("Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #3\n")
  
  # results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(input_ROIsDataPoints, input_ROI, curveModel='skewedGaussian', params='guess', sampling=250, verbose=TRUE))
  
  # Check result table
  expect_equal(result_foundPeaks$result, expected_foundPeaks)
  
  # Check result messages
  expect_equal(length(result_foundPeaks$messages), 3)
  expect_equal(result_foundPeaks$messages[1:2], expected_messages)
})

test_that('rtMin rtMax cannot be found, fit is rejected, verbose', {
  # fake data which never reaches 0.5% of maxInt in 5x ROI rt width
  tmp_ROI     	  <- data.frame(matrix(vector(), 1, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),stringsAsFactors=F)
  tmp_ROI[1,] 	  <- c("ID-1", "testCpd 1", 990., 1000., 1010., 521., 522., 523.)
  tmp_ROI[,3:8]   <- sapply(tmp_ROI[,3:8], as.numeric)
  
  # fake ROI data points
  #int <- (dnorm(rt, mean=1000, sd=0.5) * 100) + 20000
  #rt  <- seq(990, 1010, by=20/250)
  rt  <- c(990.00, 990.08, 990.16, 990.24, 990.32, 990.40, 990.48, 990.56, 990.64, 990.72, 990.80, 990.88, 990.96, 991.04, 991.12, 991.20, 991.28, 991.36, 991.44, 991.52, 991.60, 991.68, 991.76, 991.84, 991.92, 992.00, 992.08, 992.16, 992.24, 992.32, 992.40, 992.48, 992.56, 992.64, 992.72, 992.80, 992.88, 992.96, 993.04, 993.12, 993.20, 993.28, 993.36, 993.44, 993.52, 993.60, 993.68, 993.76, 993.84, 993.92, 994.00, 994.08, 994.16, 994.24, 994.32, 994.40, 994.48, 994.56, 994.64, 994.72, 994.80, 994.88, 994.96, 995.04, 995.12, 995.20, 995.28, 995.36, 995.44, 995.52, 995.60, 995.68, 995.76, 995.84, 995.92, 996.00, 996.08, 996.16, 996.24, 996.32, 996.40, 996.48, 996.56, 996.64, 996.72, 996.80, 996.88, 996.96, 997.04, 997.12, 997.20, 997.28, 997.36, 997.44, 997.52, 997.60, 997.68, 997.76, 997.84, 997.92, 998.00, 998.08, 998.16, 998.24, 998.32, 998.40, 998.48, 998.56, 998.64, 998.72, 998.80, 998.88, 998.96, 999.04, 999.12, 999.20, 999.28, 999.36, 999.44, 999.52, 999.60, 999.68, 999.76, 999.84, 999.92, 1000.00, 1000.08, 1000.16, 1000.24, 1000.32, 1000.40, 1000.48, 1000.56, 1000.64, 1000.72, 1000.80, 1000.88, 1000.96, 1001.04, 1001.12, 1001.20, 1001.28, 1001.36, 1001.44, 1001.52, 1001.60, 1001.68, 1001.76, 1001.84, 1001.92, 1002.00, 1002.08, 1002.16, 1002.24, 1002.32, 1002.40, 1002.48, 1002.56, 1002.64, 1002.72, 1002.80, 1002.88, 1002.96, 1003.04, 1003.12, 1003.20, 1003.28, 1003.36, 1003.44, 1003.52, 1003.60, 1003.68, 1003.76, 1003.84, 1003.92, 1004.00, 1004.08, 1004.16, 1004.24, 1004.32, 1004.40, 1004.48, 1004.56, 1004.64, 1004.72, 1004.80, 1004.88, 1004.96, 1005.04, 1005.12, 1005.20, 1005.28, 1005.36, 1005.44, 1005.52, 1005.60, 1005.68, 1005.76, 1005.84, 1005.92, 1006.00, 1006.08, 1006.16, 1006.24, 1006.32, 1006.40, 1006.48, 1006.56, 1006.64, 1006.72, 1006.80, 1006.88, 1006.96, 1007.04, 1007.12, 1007.20, 1007.28, 1007.36, 1007.44, 1007.52, 1007.60, 1007.68, 1007.76, 1007.84, 1007.92, 1008.00, 1008.08, 1008.16, 1008.24, 1008.32, 1008.40, 1008.48, 1008.56, 1008.64, 1008.72, 1008.80, 1008.88, 1008.96, 1009.04, 1009.12, 1009.20, 1009.28, 1009.36, 1009.44, 1009.52, 1009.60, 1009.68, 1009.76, 1009.84, 1009.92, 1010.00)
  mz  <- rep(522., length(rt))
  int <- c(20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000.000000000004, 20000.000000000011, 20000.000000000044, 20000.000000000138, 20000.000000000440, 20000.000000001379, 20000.000000004202, 20000.000000012471, 20000.000000036085, 20000.000000101762, 20000.000000279735, 20000.000000749529, 20000.000001957542, 20000.000004983285, 20000.000012365243, 20000.000029906903, 20000.000070505404, 20000.000162015076, 20000.000362886240, 20000.000792259820, 20000.001685958276, 20000.003497100206, 20000.007070520602, 20000.013934030874, 20000.026766045154, 20000.050115688977, 20000.091462962813, 20000.162704246217, 20000.282120451389, 20000.476817640294, 20000.785510725786, 20001.261345279254, 20001.974230758951, 20003.011923265476, 20004.478906058968, 20006.492053128739, 20009.172215254213, 20012.631312287038, 20016.955272261606, 20022.184166935895, 20028.291993044964, 20035.169486059534, 20042.613829355148, 20050.328868219622, 20057.938310552297, 20065.012452816813, 20071.106505701198, 20075.806105230542, 20078.773672313706, 20079.788456080285, 20078.773672313706, 20075.806105230542, 20071.106505701198, 20065.012452816813, 20057.938310552297, 20050.328868219622, 20042.613829355148, 20035.169486059534, 20028.291993044964, 20022.184166935895, 20016.955272261606, 20012.631312287038, 20009.172215254213, 20006.492053128739, 20004.478906058968, 20003.011923265476, 20001.974230758951, 20001.261345279254, 20000.785510725786, 20000.476817640294, 20000.282120451389, 20000.162704246217, 20000.091462962813, 20000.050115688977, 20000.026766045154, 20000.013934030874, 20000.007070520602, 20000.003497100206, 20000.001685958276, 20000.000792259820, 20000.000362886240, 20000.000162015076, 20000.000070505404, 20000.000029906903, 20000.000012365243, 20000.000004983285, 20000.000001957542, 20000.000000749529, 20000.000000279735, 20000.000000101762, 20000.000000036085, 20000.000000012471, 20000.000000004202, 20000.000000001379, 20000.000000000440, 20000.000000000138, 20000.000000000044, 20000.000000000011, 20000.000000000004, 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000., 20000.)
  tmp_DataPoints  <- list(data.frame(rt=rt, mz=mz, int=int))
  
  # expected foundPeaks
  expected_peakTable      <- data.frame(matrix(vector(), 1, 10, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted"))),stringsAsFactors=F)
  expected_peakTable[1,]  <- c(FALSE, NA, NA, NA, NA, NA, NA, NA, NA, NA)
  expected_peakTable[,1]  <- sapply(expected_peakTable[,c(1)], as.logical)
  
  cFit                <- NA
  expected_foundPeaks <- list(peakTable=expected_peakTable, curveFit=list(cFit))
  
  # expected messages
  expected_messages   <- c("Warning: rtMin cannot be determined for ROI #1\n", "Warning: rtMax cannot be determined for ROI #1\n", "Fit of ROI #1 is unsuccessful (cannot determine rtMin/rtMax)\n")
  
  # results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(tmp_DataPoints, tmp_ROI, curveModel='skewedGaussian', params='guess', sampling=250, verbose=TRUE))
  
  # Check result table only
  expect_equal(result_foundPeaks$result, expected_foundPeaks)
  
  # Check result messages
  expect_equal(length(result_foundPeaks$messages), 4)
  expect_equal(result_foundPeaks$messages[1:3], expected_messages)
})

test_that('mz cannot be calculated, fit is rejected, verbose', {
  # no scan fall between rtMin/rtMax after fitting, therefore nothing can be used for mz calculation (mz is NA). (fit isn't satisfactory)
  
  tmp_ROI     	  <- data.frame(matrix(vector(), 1, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),stringsAsFactors=F)
  tmp_ROI[1,] 	  <- c("ID-1", "testCpd 1", 149.112, NA, 158.67, 126.9795, 127.0195, 127.0595)
  tmp_ROI[,3:8]   <- sapply(tmp_ROI[,3:8], as.numeric)
  
  # ROI data points
  rt  <- c(149.394, 150.068, 150.741, 150.910, 150.910, 150.910, 151.078, 151.247, 152.089, 152.257, 152.257, 152.594, 152.594, 153.773, 154.615, 154.952, 155.458, 155.458, 156.300, 156.468, 156.637, 156.637, 156.805, 156.974, 157.142, 157.142, 157.310, 157.310, 157.479, 157.479, 157.647, 157.647, 157.647, 157.816, 157.816, 157.984, 157.984, 157.984, 158.153, 158.153, 158.153, 158.321, 158.321, 158.321, 158.490, 158.490, 158.490, 158.490, 158.659, 158.659, 158.659)
  mz  <- c(127.0464, 127.0561, 127.0535, 127.0154, 127.0293, 127.0540, 127.0532, 127.0261, 127.0519, 127.0234, 127.0486, 127.0257, 127.0544, 127.0471, 127.0453, 127.0565, 127.0426, 127.0544, 127.0477, 127.0220, 127.0139, 127.0250, 127.0189, 127.0189, 127.0187, 127.0509, 127.0197, 127.0552, 127.0193, 127.0536, 127.0192, 127.0395, 127.0526, 127.0192, 127.0545, 126.9916, 127.0192, 127.0518, 126.9877, 127.0196, 127.0518, 126.9825, 127.0196, 127.0502, 126.9820, 126.9944, 127.0196, 127.0490, 126.9972, 127.0195, 127.0493)
  int <- c(176.9860, 100.9088, 114.0000, 121.5390, 114.4610, 105.2671, 164.5325, 143.0000, 231.2491, 100.2164, 157.3531, 107.5632, 106.0000, 199.6444, 138.0000, 154.0000, 101.8883, 116.5039, 146.0000, 105.0000, 179.9103, 256.8206, 769.8887, 1134.0303, 2396.0000, 110.4933, 6405.2383, 144.0000, 10276.6250, 157.0000, 18852.2969, 110.2715, 127.9841, 31468.8906, 153.8988, 133.8497, 48662.4062, 248.3162, 128.1760, 72571.4375, 637.0933, 136.0000, 101874.3750, 715.7915, 100.3529, 252.6471, 131491.1250, 1474.4824, 107.2497, 160474.5000, 2006.7666)
  tmp_DataPoints  <- list(data.frame(rt=rt, mz=mz, int=int))
  
  # expected foundPeaks
  expected_peakTable      <- data.frame(matrix(vector(), 1, 10, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted"))),stringsAsFactors=F)
  expected_peakTable[1,]  <- c(FALSE, NA, NA, NA, NA, NA, NA, NA, NA, NA)
  expected_peakTable[,1]  <- sapply(expected_peakTable[,c(1)], as.logical)
  
  cFit                <- NA
  expected_foundPeaks <- list(peakTable=expected_peakTable, curveFit=list(cFit))
  
  # expected messages
  expected_messages   <- c("Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Fit of ROI #1 is unsuccessful (cannot determine mz/mzMin/mzMax)\n")
  
  # results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(tmp_DataPoints, tmp_ROI, curveModel='skewedGaussian', params='guess', sampling=250, verbose=TRUE))
  
  # Check result table only
  expect_equal(result_foundPeaks$result, expected_foundPeaks)
  
  # Check result messages
  expect_equal(length(result_foundPeaks$messages), 3)
  expect_equal(result_foundPeaks$messages[1:2], expected_messages)
})

# No other curveModel currently available

test_that('ratio of fit residuals at apex or across maximum is superior to "maxApexResidualRatio", fit is rejected, verbose', {
  # Cpd3 fit fails, detected using the apex residuals ratio
  # Need another sample, same ROI
  
  ## Prepare data
  tmp_singleSpectraDataPath <- system.file('cdf/KO/ko18.CDF', package = "faahKO")
  tmp_raw_data  						<- MSnbase::readMSData(tmp_singleSpectraDataPath, centroided=TRUE, mode='onDisk')
  # ROIDataPoints for each window
  tmp_input_ROIsDataPoints  <- extractSignalRawData(tmp_raw_data, rt=input_ROI[,c('rtMin','rtMax')], mz=input_ROI[,c('mzMin','mzMax')], verbose=F)
  # found peaks
  tmp_found_peakTable                 <- data.frame(matrix(vector(), 4, 10, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted"))),stringsAsFactors=F)
  tmp_found_peakTable[1,]             <- c(TRUE, 3333.8625894557053, 3368.233, 3407.4362838927614, 522.194778, 522.20001220703125, 522.205222, 21447174.404490683, 758336, 765009.9805796633)
  tmp_found_peakTable[2,]             <- c(TRUE, 3373.3998828113113, 3413.4952530120481, 3454.4490330927388, 496.195038, 496.20001220703125, 496.204962, 35659353.614476241, 1149440, 1145857.7611069249)
  tmp_found_peakTable[3,]             <- c(FALSE, NA, NA, NA, NA, NA, NA, NA, NA, NA)
  tmp_found_peakTable[4,]             <- c(TRUE, 3672.3110625980275, 3714.088, 3761.43921706666, 536.194638, 536.20001220703125, 536.205362, 6467062.4309558524, 196160, 189416.24807174454)
  tmp_found_peakTable[,c(1)]       <- sapply(tmp_found_peakTable[,c(1)], as.logical)
  tmp_found_peakTable[,c(2:10)] <- sapply(tmp_found_peakTable[,c(2:10)], as.numeric)
  # fit
  tmp_cFit1           <- list(amplitude=122363.51256736703, center=3362.233, sigma=0.075489598945304492, gamma=0.0025160536725299734, fitStatus=2, curveModel="skewedGaussian")
  class(tmp_cFit1)    <- 'peakPantheR_curveFit'
  tmp_cFit2           <- list(amplitude=204749.86097918145, center=3409.182, sigma=0.075731781812843249, gamma=0.0013318670577834328, fitStatus=2, curveModel="skewedGaussian")
  class(tmp_cFit2)    <- 'peakPantheR_curveFit'
  tmp_cFit3           <- NA
  tmp_cFit4           <- list(amplitude=26628.505498512375, center=3708.088, sigma=0.064131129861254479, gamma=0.0015719426982490699, fitStatus=2, curveModel="skewedGaussian")
  class(tmp_cFit4)    <- 'peakPantheR_curveFit'
  tmp_found_curveFit  <- list(tmp_cFit1, tmp_cFit2, tmp_cFit3, tmp_cFit4)
  
  # expected results
  expected_foundPeaks <- list(peakTable=tmp_found_peakTable, curveFit=tmp_found_curveFit)
  
  # expected messages
  expected_messages   <- c("Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #2\n", "Fit of ROI #3 is unsuccessful (apex residuals is 0.45 of max fit intensity, max intensity residuals is 0.46 of max fit intensity)\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #4\n")
  
  # results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(tmp_input_ROIsDataPoints, input_ROI, curveModel='skewedGaussian', params='guess', sampling=250, verbose=TRUE))
  
  # Check result table only
  expect_equal(result_foundPeaks$result, expected_foundPeaks)
  
  # Check result messages
  expect_equal(length(result_foundPeaks$messages), 5)
  expect_equal(result_foundPeaks$messages[1:4], expected_messages)
})

test_that('change params for window #3', {
  # input params
  tmp_params    <- list( init_params  = list(amplitude=1E5, center=3455., sigma=0.1, gamma=0),
                         lower_bounds = list(amplitude=0,   center=3450., sigma=0,   gamma=-0.1),
                         upper_bounds = list(amplitude=1E9, center=3460., sigma=5,   gamma=1))
  input_params  <- list('guess', 'guess', tmp_params, 'guess')
  # expected foundPeaks
  expected_foundPeaks                         <- foundPeaks
  expected_foundPeaks$peakTable[3,2:10]       <- c(3418.0076795585401, 3455.6277710843374, 3495.4734240188186, 464.195358, 464.2000122, 464.204642, 11307215.264967661, 380736, 381327.26552768378)
  expected_foundPeaks$curveFit[[3]]$amplitude <- 64246.052173667762
  expected_foundPeaks$curveFit[[3]]$center    <- 3450
  expected_foundPeaks$curveFit[[3]]$sigma     <- 0.07533469863886906
  expected_foundPeaks$curveFit[[3]]$gamma     <- 0.0019238229766131536
  expected_foundPeaks$curveFit[[3]]$fitStatus <- 2
  # expected messages
  expected_messages   <- c("Curve fitting parameters passed as input employed\n","Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #3\n")
  
  # results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(input_ROIsDataPoints, input_ROI, curveModel='skewedGaussian', params=input_params, sampling=250, verbose=TRUE))
  
  # Check result table
  expect_equal(result_foundPeaks$result, expected_foundPeaks, tolerance=1e-5)
  
  # Check result messages
  expect_equal(length(result_foundPeaks$messages), 4)
  expect_equal(result_foundPeaks$messages[1:3], expected_messages)
})

test_that('change sampling', {
  # expected foundPeaks
  expected_peakTable      <- data.frame(matrix(vector(), 4, 10, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted"))),stringsAsFactors=F)
  expected_peakTable[1,]  <- c(TRUE, 3309.6884911519801, 3346.7859591836732, 3385.4800395368861, 522.194778, 522.20001220703125, 522.205222, 26133882.5658131838, 889280, 901012.10599065467)
  expected_peakTable[2,]  <- c(TRUE, 3345.0894935650540, 3386.4953673469390, 3428.4561855932079, 496.20001220703125, 496.20001220703125, 496.20001220703125, 35474025.5332010239, 1128960, 1113574.43999634334)
  expected_peakTable[3,]  <- c(TRUE, 3450.0344897959185, 3451.5574489795918, 3501.7095764174951, 464.195358, 464.20001220703125, 464.204642, 7456470.7446634285, 380736, 389624.14409317775)
  expected_peakTable[4,]  <- c(TRUE, 3670.8488688282255, 3704.0847551020411, 3740.0915161411931, 536.20001220703125, 536.20001220703125, 536.20001220703125, 8626359.7845999431, 330176, 326758.81671814714)
  expected_peakTable[,1]  <- sapply(expected_peakTable[,c(1)], as.logical)
  expected_foundPeaks     <- list(peakTable=expected_peakTable, curveFit=found_curveFit)
  
  # results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(input_ROIsDataPoints, input_ROI, curveModel='skewedGaussian', params='guess', sampling=50, verbose=FALSE))
  
  # Check result table
  expect_equal(result_foundPeaks$result, expected_foundPeaks)
  
  # Check result messages
  expect_equal(length(result_foundPeaks$messages), 0)
})

test_that('In fit ratio calculation, special case when "IntRawApex" cannot be determined (no raw data scans exist a fit apex), verbose', {
  # no scan fall at both sides of the fit apex (cannot be interpolated): the raw data intensity at fit apex ("IntRawApex") is set to 0
  
  tmp_ROI     	  <- data.frame(matrix(vector(), 1, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),stringsAsFactors=F)
  tmp_ROI[1,] 	  <- c("ID-1", "testCpd 1", 216.4, 224.4, 232.4, 428.367, 428.3734, 428.3799)
  tmp_ROI[,3:8]   <- sapply(tmp_ROI[,3:8], as.numeric)
  
  # ROI data points
  rt  <- c(218.327, 219.601, 222.090, 224.978, 229.526)
  mz  <- c(428.3786, 428.3707, 428.3705, 428.3772, 428.3787)
  int <- c(249.0000, 183.1346, 112.0000, 134.0000, 104.0000)
  tmp_DataPoints  <- list(data.frame(rt=rt, mz=mz, int=int))
  
  # expected foundPeaks
  expected_peakTable      <- data.frame(matrix(vector(), 1, 10, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted"))),stringsAsFactors=F)
  expected_peakTable[1,]  <- c(FALSE, NA, NA, NA, NA, NA, NA, NA, NA, NA)
  expected_peakTable[,1]  <- sapply(expected_peakTable[,c(1)], as.logical)
  
  cFit                <- NA
  expected_foundPeaks <- list(peakTable=expected_peakTable, curveFit=list(cFit))
  
  # expected messages
  expected_messages   <- c("Warning: rtMin/rtMax outside of ROI; datapoints cannot be used for mzMin/mzMax calculation, approximate mz and returning ROI$mzMin and ROI$mzMax for ROI #1\n", "Fit of ROI #1 is unsuccessful (apex residuals is 0.18 of max fit intensity, max intensity residuals is 1 of max fit intensity)\n")
  
  # results (output, warnings and messages)
  result_foundPeaks   <- evaluate_promise(findTargetFeatures(tmp_DataPoints, tmp_ROI, curveModel='skewedGaussian', params='guess', sampling=250, verbose=TRUE))
  
  # Check result table only
  expect_equal(result_foundPeaks$result, expected_foundPeaks)
  
  # Check result messages
  expect_equal(length(result_foundPeaks$messages), 3)
  expect_equal(result_foundPeaks$messages[1:2], expected_messages)
})

test_that('raise errors', {
  # ROIsDataPoints doesn't match number of ROI
  expect_error(findTargetFeatures(input_ROIsDataPoints, input_ROI[1:3,], curveModel='skewedGaussian', params='guess'), 'Check input, number of ROIsDataPoints entries must match the number of rows of ROI', fixed=TRUE)
  
  # data points rt outside of ROI
  # rtMin side
  tmpDPoints      <- input_ROIsDataPoints
  tmpDPoints[[2]] <- extractSignalRawData(raw_data, rt=c(3000, 3440), mz=c(496.195038, 496.204962), verbose=F)[[1]]
  expect_error(findTargetFeatures(tmpDPoints, input_ROI, curveModel='skewedGaussian', params='guess'), 'Check input not all datapoints for window #2 are into the corresponding ROI (rt)', fixed=TRUE)
  # rtMax
  tmpDPoints      <- input_ROIsDataPoints
  tmpDPoints[[3]] <- extractSignalRawData(raw_data, rt=c(3420., 3600.), mz=c(464.195358, 464.204642), verbose=F)[[1]]
  expect_error(findTargetFeatures(tmpDPoints, input_ROI, curveModel='skewedGaussian', params='guess'), 'Check input not all datapoints for window #3 are into the corresponding ROI (rt)', fixed=TRUE)
  
  # data points mz outside of ROI
  # mzMin side
  tmpDPoints      <- input_ROIsDataPoints
  tmpDPoints[[2]] <- extractSignalRawData(raw_data, rt=c(3280, 3440), mz=c(494.195038, 496.204962), verbose=F)[[1]]
  expect_error(findTargetFeatures(tmpDPoints, input_ROI, curveModel='skewedGaussian', params='guess'), 'Check input not all datapoints for window #2 are into the corresponding ROI (mz)', fixed=TRUE)
  # mzMax
  tmpDPoints      <- input_ROIsDataPoints
  tmpDPoints[[3]] <- extractSignalRawData(raw_data, rt=c(3420., 3495.), mz=c(464.195358, 466.204642), verbose=F)[[1]]
  expect_error(findTargetFeatures(tmpDPoints, input_ROI, curveModel='skewedGaussian', params='guess'), 'Check input not all datapoints for window #3 are into the corresponding ROI (mz)', fixed=TRUE)
  
  # params is not character or list
  expect_error(findTargetFeatures(input_ROIsDataPoints, input_ROI, curveModel='skewedGaussian', params=5), 'Check input, "params" must be "guess" or list', fixed=TRUE)
  
  # params is character but not 'guess'
  expect_error(findTargetFeatures(input_ROIsDataPoints, input_ROI, curveModel='skewedGaussian', params='not guess'), 'Check input, "params" must be "guess" if not list', fixed=TRUE)
  
  # params is a list of wrong length
  expect_error(findTargetFeatures(input_ROIsDataPoints, input_ROI, curveModel='skewedGaussian', params=vector('list',2)), 'Check input, number of parameters must match number of rows of ROI', fixed=TRUE)
})
