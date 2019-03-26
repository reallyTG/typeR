context('plotEICDetectedPeakwidth()')


## Input and expected data
# fake sample 1
# ROI data points
rt1  <- seq(990, 1010, by=20/250)
mz1  <- rep(522., length(rt1))
int1 <- (dnorm(rt1, mean=1000, sd=1.5) * 100) + 1
tmp_DataPoints1  <- data.frame(rt=rt1, mz=mz1, int=int1)
# fittedCurve
fit1        <- list(amplitude=37.068916502809756, center=999.3734222573454, sigma=0.58493182568124724, gamma=0.090582029276037035, fitStatus=2, curveModel="skewedGaussian")
class(fit1) <- 'peakPantheR_curveFit'

# fake sample 2
# ROI data points
rt2  <- seq(990, 1010, by=20/250)
mz2  <- rep(522., length(rt2))
int2 <- (dnorm(rt2, mean=1002, sd=1.5) * 100) + 1
tmp_DataPoints2  <- data.frame(rt=rt2, mz=mz2, int=int2)
# fittedCurve
fit2        <- list(amplitude=37.073067416755556, center=1001.3736564832565, sigma=0.58496485738212201, gamma=0.090553713725151905, fitStatus=2, curveModel="skewedGaussian")
class(fit2) <- 'peakPantheR_curveFit'


test_that('plot feature in 1 sample', {
	# result plot
  result_plot <- plotEICDetectedPeakwidth(list(tmp_DataPoints1), cpdID='ID-1', cpdName='testCpd 1', rt=1000., rtMin=995., rtMax=1005., mzMin=521., mzMax=523., ratio=0.85, sampling=250, curveFitSampleList=list(fit1), sampleColour=NULL, verbose=FALSE)

  # cannot compare plot to a stored version due to some string mismatch (even if the same plot is called twice)
  # Check plot properties
  expect_is(result_plot, 'gtable')
  expect_is(result_plot, 'gTree')
  expect_is(result_plot, 'grob')
  expect_is(result_plot, 'gDesc')
  expect_equal(length(result_plot), 2)
  # number of subplots
  expect_equal(length(result_plot)[[1]], 2)
})

test_that('plot feature in 2 samples, change colours', {
  # result plot
  result_plot <- plotEICDetectedPeakwidth(list(tmp_DataPoints1, tmp_DataPoints2), cpdID=c('ID-1', 'ID-2'), cpdName=c('testCpd 1', 'testCpd 2'), rt=c(1000., 1002.), rtMin=c(995., 997.), rtMax=c(1005.,1007.), mzMin=c(521.,521.), mzMax=c(523.,523.), ratio=0.85, sampling=250, curveFitSampleList=list(fit1, fit2), sampleColour=c('blue', 'red'), verbose=FALSE)
  
  # cannot compare plot to a stored version due to some string mismatch (even if the same plot is called twice)
  # Check plot properties
  expect_is(result_plot, 'gtable')
  expect_is(result_plot, 'gTree')
  expect_is(result_plot, 'grob')
  expect_is(result_plot, 'gDesc')
  expect_equal(length(result_plot), 2)
  # number of subplots
  expect_equal(length(result_plot)[[1]], 2)
})

test_that('plot feature in 2 samples, rtMin and/or rtMax are NA', {
  # result plot
  result_plotNA <- plotEICDetectedPeakwidth(list(tmp_DataPoints1, tmp_DataPoints2), cpdID=c('ID-1', 'ID-2'), cpdName=c('testCpd 1', 'testCpd 2'), rt=c(1000., 1002.), rtMin=c(NA, 997.), rtMax=c(1005.,NA), mzMin=c(521.,521.), mzMax=c(523.,523.), ratio=0.85, sampling=250, curveFitSampleList=list(fit1, fit2), sampleColour=c('blue', 'red'), verbose=FALSE)
  
  # cannot compare plot to a stored version due to some string mismatch (even if the same plot is called twice)
  # Check plot properties
  expect_is(result_plotNA, 'gtable')
  expect_is(result_plotNA, 'gTree')
  expect_is(result_plotNA, 'grob')
  expect_is(result_plotNA, 'gDesc')
  expect_equal(length(result_plotNA), 2)
  # number of subplots
  expect_equal(length(result_plotNA)[[1]], 2)
})

test_that('colour warning, ratio replacement', {
  # Expected message
  expected_message <- c("Error: ratio must be between 0 and 1, replaced by default value\n", "Warning: sampleColour length must match the number of samples; default colour used\n")
  
  # result plot
  result_plot <- evaluate_promise(plotEICDetectedPeakwidth(list(tmp_DataPoints1, tmp_DataPoints2), cpdID=c('ID-1', 'ID-2'), cpdName=c('testCpd 1', 'testCpd 2'), rt=c(1000., 1002.), rtMin=c(995., 997.), rtMax=c(1005.,1007.), mzMin=c(521.,521.), mzMax=c(523.,523.), ratio=2, sampling=250, curveFitSampleList=list(fit1, fit2), sampleColour=c('blue', 'red', 'grey'), verbose=TRUE))
  
  # check messages confirming the replacements
  expect_equal(result_plot$messages, expected_message)
  
  # cannot compare plot to a stored version due to some string mismatch (even if the same plot is called twice)
  # Check plot properties
  expect_is(result_plot$result, 'gtable')
  expect_is(result_plot$result, 'gTree')
  expect_is(result_plot$result, 'grob')
  expect_is(result_plot$result, 'gDesc')
  expect_equal(length(result_plot$result), 2)
  # number of subplots
  expect_equal(length(result_plot$result)[[1]], 2)
})

test_that('raise errors', {
  # ROIDataPointSampleList is not a list
  msg1    <- c('Error: "ROIDataPointSampleList" must be a list of data.frame')
  expect_error(plotEICDetectedPeakwidth('not a list', cpdID='ID-1', cpdName='testCpd 1', rt=1000., rtMin=995., rtMax=1005., mzMin=521., mzMax=523., ratio=0.85, sampling=250, curveFitSampleList=list(fit1), sampleColour=NULL, verbose=FALSE), msg1, fixed=TRUE)
  # ROIDataPointSampleList length is wrong
  msg2    <- c('"ROIDataPointSampleList", "rt", "rtMin" and "rtMax" must be the same length')
  expect_error(plotEICDetectedPeakwidth(list(tmp_DataPoints1, tmp_DataPoints2), cpdID='ID-1', cpdName='testCpd 1', rt=1000., rtMin=995., rtMax=1005., mzMin=521., mzMax=523., ratio=0.85, sampling=250, curveFitSampleList=list(fit1), sampleColour=NULL, verbose=FALSE), msg2, fixed=TRUE)
  # rt length is wrong
  msg3    <- c('"ROIDataPointSampleList", "rt", "rtMin" and "rtMax" must be the same length')
  expect_error(plotEICDetectedPeakwidth(list(tmp_DataPoints1), cpdID='ID-1', cpdName='testCpd 1', rt=c(1000., 1002.), rtMin=995., rtMax=1005., mzMin=521., mzMax=523., ratio=0.85, sampling=250, curveFitSampleList=list(fit1), sampleColour=NULL, verbose=FALSE), msg3, fixed=TRUE)
  # rtmin length is wrong
  msg4    <- c('"curveFitSampleList", "rtMin", "rtMax" and "ROIDataPointSampleList" must be the same length')
  expect_error(plotEICDetectedPeakwidth(list(tmp_DataPoints1), cpdID='ID-1', cpdName='testCpd 1', rt=1000., rtMin=c(995., 997.), rtMax=1005., mzMin=521., mzMax=523., ratio=0.85, sampling=250, curveFitSampleList=list(fit1), sampleColour=NULL, verbose=FALSE), msg4, fixed=TRUE)
  # rtmax length is wrong
  msg5    <- c('"curveFitSampleList", "rtMin", "rtMax" and "ROIDataPointSampleList" must be the same length')
  expect_error(plotEICDetectedPeakwidth(list(tmp_DataPoints1), cpdID='ID-1', cpdName='testCpd 1', rt=1000., rtMin=995., rtMax=c(1005.,1007.), mzMin=521., mzMax=523., ratio=0.85, sampling=250, curveFitSampleList=list(fit1), sampleColour=NULL, verbose=FALSE), msg5, fixed=TRUE)
  # curveFitSampleList length is wrong
  msg6    <- c('"curveFitSampleList", "rtMin", "rtMax" and "ROIDataPointSampleList" must be the same length')
  expect_error(plotEICDetectedPeakwidth(list(tmp_DataPoints1), cpdID='ID-1', cpdName='testCpd 1', rt=1000., rtMin=995., rtMax=1005., mzMin=521., mzMax=523., ratio=0.85, sampling=250, curveFitSampleList=list(fit1,fit2), sampleColour=NULL, verbose=FALSE), msg6, fixed=TRUE)
})
