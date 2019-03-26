context('getTargetFeatureStatistic()')

skip_if(getRversion() >= "3.6")
skip_if_not_installed('faahKO',  minimum_version = '1.18.0')
library(faahKO)


## Input and expected data
# use ko15.CDf file from the pkg faahKO

# fitted curves
cFit1           <- list(amplitude=162404.8057918259, center=3341.888, sigma=0.078786133031045896, gamma=0.0018336101984172684, fitStatus=2, curveModel="skewedGaussian")
class(cFit1)    <- 'peakPantheR_curveFit'
cFit2           <- list(amplitude=199249.10572753669, center=3382.577, sigma=0.074904415304607966, gamma=0.0011471899372353885, fitStatus=2, curveModel="skewedGaussian")
class(cFit2)    <- 'peakPantheR_curveFit'
cFit3           <- list(amplitude=31645.961277502651, center=3451.435, sigma=0.064803553287811053, gamma=2.8557893789555022, fitStatus=2, curveModel="skewedGaussian")
class(cFit3)    <- 'peakPantheR_curveFit'
cFit4           <- list(amplitude=59193.591103772116, center=3698.697, sigma=0.082789238806238355, gamma=0.0026044299691057823, fitStatus=2, curveModel="skewedGaussian")
class(cFit4)    <- 'peakPantheR_curveFit'
input_fitCurves <- list(cFit1, cFit2, cFit3, cFit4)
 
# ROI
input_ROI       <- data.frame(matrix(vector(), 4, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))),stringsAsFactors=F)
input_ROI[1,] 	<- c("ID-1", "testCpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
input_ROI[2,] 	<- c("ID-2", "testCpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
input_ROI[3,] 	<- c("ID-3", "testCpd 3", 3420., 3454.435, 3495., 464.195358, 464.2, 464.204642)
input_ROI[4,] 	<- c("ID-4", "testCpd 4", 3670., 3701.697, 3745., 536.194638, 536.2, 536.205362)
input_ROI[,3:8] <- sapply(input_ROI[,3:8], as.numeric)

# foundPeakTable
input_foundPeakTable      <- data.frame(matrix(vector(), 4, 10, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted"))),stringsAsFactors=F)
input_foundPeakTable[1,]  <- c(TRUE, 3309.7589296586070, 3346.8277590361445, 3385.4098874628098, 522.194778, 522.20001220703125, 522.205222, 26133726.6811244078, 889280, 901015.80529226747)
input_foundPeakTable[2,]  <- c(TRUE, 3345.3766648628907, 3386.5288072289159, 3428.2788374983961, 496.20001220703125, 496.20001220703125, 496.20001220703125, 35472141.3330242932, 1128960, 1113576.69008227298)
input_foundPeakTable[3,]  <- c(TRUE, 3451.2075903614455, 3451.5072891566265, 3501.6697504924518, 464.195358, 464.20001220703125, 464.204642, 7498427.1583901159, 380736, 389632.13549519412)
input_foundPeakTable[4,]  <- c(TRUE, 3670.9201232710743, 3704.1427831325304, 3740.0172511251831, 536.20001220703125, 536.20001220703125, 536.20001220703125, 8626279.9788195733, 330176, 326763.87246511364)
input_foundPeakTable[,1]  <- sapply(input_foundPeakTable[,c(1)], as.logical)

# peakStatistics
peakStatistics                  <- input_foundPeakTable
peakStatistics$ppm_error        <- c(0.023376160866574614, 0.024601030353423384, 0.026296922148575364, 0.022765817240815486)
peakStatistics$rt_dev_sec       <- c(1.93975903614455092, 0.95180722891564074, 2.92771084337346110, 2.44578313253032320)
peakStatistics$tailingFactor    <- c(1.0153573486330891, 1.0053782620427065, 207.6939219686769036, 1.0305289730128095)
peakStatistics$asymmetryFactor  <- c(1.0268238825675249, 1.0093180792278085, 380.5019028782010082, 1.0536948855480386)


test_that('no verbose', {
  # expected foundPeaks
  expected_featureStatistic <- peakStatistics

	# results (output, warnings and messages)
  result_featureStatistic   <- evaluate_promise(getTargetFeatureStatistic(input_fitCurves, input_ROI, input_foundPeakTable, verbose=FALSE))

  # Check result table
  expect_equal(result_featureStatistic$result, expected_featureStatistic)

  # Check no result messages
  expect_equal(length(result_featureStatistic$messages), 0)
})

test_that('verbose', {
  # expected foundPeaks
  expected_featureStatistic <- peakStatistics
  
  # results (output, warnings and messages)
  result_featureStatistic   <- evaluate_promise(getTargetFeatureStatistic(input_fitCurves, input_ROI, input_foundPeakTable, verbose=TRUE))
  
  # Check result table
  expect_equal(result_featureStatistic$result, expected_featureStatistic)
  
  # Check messages (cannot match timing)
  expect_equal(length(result_featureStatistic$messages), 1)
})

test_that('no rtMin (#1), no rtMax (#2), no fittedCurve (#3), no apexRT (#4)', {
  # foundPeakTable
  tmp_foundPeakTable              <- input_foundPeakTable
  tmp_foundPeakTable[1, 'rtMin']  <- NA
  tmp_foundPeakTable[2, 'rtMax']  <- NA
  tmp_foundPeakTable[4, 'rt']     <- NA
  
  # curveFit
  tmp_fitCurves      <- input_fitCurves
  tmp_fitCurves[[3]] <- NA
  
  # expected foundPeaks
  expected_featureStatistic                 <- peakStatistics
  expected_featureStatistic$rtMin[1]        <- as.numeric(NA)
  expected_featureStatistic$rtMax[2]        <- as.numeric(NA)
  expected_featureStatistic$rt[4]           <- as.numeric(NA)
  expected_featureStatistic$tailingFactor   <- as.numeric(NA)
  expected_featureStatistic$asymmetryFactor <- as.numeric(NA)
  expected_featureStatistic$rt_dev_sec[4]   <- as.numeric(NA)
  
  # results (output, warnings and messages)
  result_featureStatistic   <- evaluate_promise(getTargetFeatureStatistic(tmp_fitCurves, input_ROI, tmp_foundPeakTable, verbose=TRUE))
  
  # Check result table
  expect_equal(result_featureStatistic$result, expected_featureStatistic)
  
  # Check messages (cannot match timing)
  expect_equal(length(result_featureStatistic$messages), 1)
})

test_that('no rt (#2), no mz (#3)', {
  # foundPeakTable
  tmp_ROI           <- input_ROI
  tmp_ROI[2, 'rt']  <- NA
  tmp_ROI[3, 'mz']  <- NA

  # expected foundPeaks
  expected_featureStatistic               <- peakStatistics
  expected_featureStatistic$rt_dev_sec[2] <- as.numeric(NA)
  expected_featureStatistic$ppm_error[3]  <- as.numeric(NA)
  
  # results (output, warnings and messages)
  result_featureStatistic   <- evaluate_promise(getTargetFeatureStatistic(input_fitCurves, tmp_ROI, input_foundPeakTable, verbose=TRUE))
  
  # Check result table
  expect_equal(result_featureStatistic$result, expected_featureStatistic)
  
  # Check messages (cannot match timing)
  expect_equal(length(result_featureStatistic$messages), 1)
})

test_that('wrong rtMin (#2), wrong rtMax (#3)', {
  # if rtMin > 5/10% and rtMax > 5/10% maxInt, cannot calculate statistic. (Shouldn't happen as rtMin rtMax are at 0.5% maxInt)
  # foundPeakTable
  tmp_foundPeakTable             <- input_foundPeakTable
  tmp_foundPeakTable[2, 'rtMin'] <- 3380.
  tmp_foundPeakTable[3, 'rtMax'] <- 3460.
  
  # expected foundPeaks
  expected_featureStatistic                     <- peakStatistics
  expected_featureStatistic$rtMin[2]            <- 3380.
  expected_featureStatistic$rtMax[3]            <- 3460.
  expected_featureStatistic$tailingFactor[2]    <- as.numeric(NA)
  expected_featureStatistic$asymmetryFactor[2]  <- as.numeric(NA)
  expected_featureStatistic$tailingFactor[3]    <- as.numeric(NA)
  expected_featureStatistic$asymmetryFactor[3]  <- as.numeric(NA)
  
  # results (output, warnings and messages)
  result_featureStatistic   <- evaluate_promise(getTargetFeatureStatistic(input_fitCurves, input_ROI, tmp_foundPeakTable, verbose=TRUE))
  
  # Check result table
  expect_equal(result_featureStatistic$result, expected_featureStatistic)
  
  # Check messages (cannot match timing)
  expect_equal(length(result_featureStatistic$messages), 1)
})

test_that('raise errors', {
  # targetFeatTable and foundPeakTable dimension mismatch
  expect_error(getTargetFeatureStatistic(input_fitCurves, input_ROI[1:3,], input_foundPeakTable, verbose=TRUE), 'Number of features in "targetFeatTable" (3) and "foundPeakTable" (4) do not match!', fixed=TRUE)

  # Number of fittedCurve and foundPeakTable mismatch
  expect_error(getTargetFeatureStatistic(input_fitCurves[1:3], input_ROI, input_foundPeakTable, verbose=TRUE), 'Number of fitted curves in "fittedCurves" (3) and number of features in "foundPeakTable" (4) do not match!', fixed=TRUE)
})
