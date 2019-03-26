context('saveMultiEIC()')


## Input and expected data
# fake ROI 1
# ROI data points
rt1  <- seq(990, 1010, by=20/250)
mz1  <- rep(522.2, length(rt1))
int1 <- (dnorm(rt1, mean=1000, sd=1.5) * 100) + 1
tmp_DataPoints1  <- data.frame(rt=rt1, mz=mz1, int=int1)
# fittedCurve
fit1        <- list(amplitude=37.068916502809756, center=999.3734222573454, sigma=0.58493182568124724, gamma=0.090582029276037035, fitStatus=2, curveModel="skewedGaussian")
class(fit1) <- 'peakPantheR_curveFit'
# fake ROI 2
# ROI data points
rt2  <- seq(990, 1010, by=20/250)
mz2  <- rep(464.2, length(rt2))
int2 <- (dnorm(rt2, mean=1002, sd=1.5) * 100) + 1
tmp_DataPoints2  <- data.frame(rt=rt2, mz=mz2, int=int2)
# fittedCurve
fit2        <- list(amplitude=37.073067416755556, center=1001.3736564832565, sigma=0.58496485738212201, gamma=0.090553713725151905, fitStatus=2, curveModel="skewedGaussian")
class(fit2) <- 'peakPantheR_curveFit'
# ROIsDataPoints
input_ROIsDataPoints  <- list(tmp_DataPoints1, tmp_DataPoints2)
# curveFit
input_curveFit        <- list(fit1, fit2)

# peakTable
input_peakTable     <- data.frame(matrix(vector(), 2, 10, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted"))),stringsAsFactors=F)
input_peakTable[1,] <- c(TRUE, 995., 1000., 1005., 522.19, 522.2, 522.21, 20000, 21, 21)
input_peakTable[2,] <- c(TRUE, 997., 1002., 1007., 464.19, 464.2, 464.21, 20000, 21, 21)
input_peakTable[,1] <- sapply(input_peakTable[,c(1)], as.logical)


test_that('default parameters, verbose', {
  # temporary file
  savePath1  <- tempfile(pattern="file", tmpdir=tempdir(), fileext='.png')

	# results (output, warnings and messages)
  result_plot <- evaluate_promise(saveSingleFileMultiEIC(ROIsDataPoint=input_ROIsDataPoints, curveFit=input_curveFit, foundPeakTable=input_peakTable, savePath=savePath1, width=15, height=15, verbose=TRUE))

  # Check plot has been produced
  expect_true(file.exists(savePath1))

  # Check result messages (save path)
  expect_equal(length(result_plot$messages), 1)
})

test_that('default parameters, no verbose', {
  # temporary file
  savePath2  <- tempfile(pattern="file", tmpdir=tempdir(), fileext='.png')

  # results (output, warnings and messages)
  result_plot <- evaluate_promise(saveSingleFileMultiEIC(ROIsDataPoint=input_ROIsDataPoints, curveFit=input_curveFit, foundPeakTable=input_peakTable, savePath=savePath2, width=15, height=15, verbose=FALSE))

  # Check plot has been produced
  expect_true(file.exists(savePath2))

  # Check no result messages
  expect_equal(length(result_plot$messages), 0)
})

test_that('only one plot, no verbose', {
  # temporary file
  savePath3  <- tempfile(pattern="file", tmpdir=tempdir(), fileext='.png')

  # results (output, warnings and messages)
  result_plot <- evaluate_promise(saveSingleFileMultiEIC(ROIsDataPoint=list(input_ROIsDataPoints[[1]]), curveFit=list(input_curveFit[[1]]), foundPeakTable=input_peakTable[1,], savePath=savePath3, width=15, height=15, verbose=FALSE))

  # Check plot has been produced
  expect_true(file.exists(savePath3))

  # Check no result messages
  expect_equal(length(result_plot$messages), 0)
})

test_that('raise errors', {
  savePath4  <- tempfile(pattern="file", tmpdir=tempdir(), fileext='.png')
  
  # ROIsDataPoint and foundPeakTable dimension mismatch
  msg1 <- 'Number of ROI datapoints in "ROIsDataPoint" (1) and features in "foundPeakTable" (2) do not match!'
  expect_error(saveSingleFileMultiEIC(ROIsDataPoint=list(input_ROIsDataPoints[[1]]), curveFit=list(input_curveFit[[1]]), foundPeakTable=input_peakTable, savePath=savePath4, width=15, height=15, verbose=TRUE), msg1, fixed=TRUE)
  
  # ROIsDataPoint and curveFit dimension mismatch
  msg2 <- 'Number of ROI datapoints in "ROIsDataPoint" (1) and fitted curves in "curveFit" (2) do not match!'
  expect_error(saveSingleFileMultiEIC(ROIsDataPoint=list(input_ROIsDataPoints[[1]]), curveFit=input_curveFit, foundPeakTable=input_peakTable[1,], savePath=savePath4, width=15, height=15, verbose=TRUE), msg2, fixed=TRUE)
})
