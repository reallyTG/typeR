context('plotEICFit()')


## Input data
# fake sample 1
# ROI data points
rt1             <- seq(990, 1010, by=20/250)
mz1             <- rep(522., length(rt1))
int1            <- (dnorm(rt1, mean=1000, sd=1.5) * 100) + 1
tmp_DataPoints1 <- data.frame(rt=rt1, mz=mz1, int=int1)
# fittedCurve
fit1            <- list(amplitude=37.068916502809756, center=999.3734222573454, sigma=0.58493182568124724, gamma=0.090582029276037035, fitStatus=2, curveModel="skewedGaussian")
class(fit1)     <- 'peakPantheR_curveFit'

# fake sample 2
# ROI data points
rt2             <- seq(990, 1010, by=20/250)
mz2             <- rep(522., length(rt2))
int2            <- (dnorm(rt2, mean=1002, sd=1.5) * 100) + 1
tmp_DataPoints2 <- data.frame(rt=rt2, mz=mz2, int=int2)
# fittedCurve
fit2            <- list(amplitude=37.073067416755556, center=1001.3736564832565, sigma=0.58496485738212201, gamma=0.090553713725151905, fitStatus=2, curveModel="skewedGaussian")
class(fit2)     <- 'peakPantheR_curveFit'



test_that('plot feature in 1 sample', {
	# generate plot
  result_plot1SplNoCol <- plotEICFit(ROIDataPointSampleList=list(tmp_DataPoints1),
                                     curveFitSampleList=list(fit1),
                                     rtMin=995., rtMax=1005.,
                                     sampling=250, sampleColour=NULL, verbose=FALSE)
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(result_plot1SplNoCol))
  expect_equal(result_plot1SplNoCol$labels$x, "Retention Time (sec)")
  expect_equal(result_plot1SplNoCol$labels$y, "Intensity")
  expect_equal(length(result_plot1SplNoCol), 9)
})

test_that('plot feature in 1 sample, no curveFit with warning', {
  # Expected message
  expected_message  <- c("\"curveFitSampleList\", \"rtMin\" or \"rtMax\" no provided, curveFit will not be plotted\n")
  
  # generate plot
  result_plot1SplNoFitNoCol <- evaluate_promise(plotEICFit(ROIDataPointSampleList=list(tmp_DataPoints1),
                                                          curveFitSampleList=NULL,
                                                          rtMin=995., rtMax=1005.,
                                                          sampling=250, sampleColour=NULL, 
                                                          verbose=TRUE))
  
  # Check messages confirming the replacements
  expect_equal(result_plot1SplNoFitNoCol$messages, expected_message)

  # Check plot properties
  expect_true(ggplot2::is.ggplot(result_plot1SplNoFitNoCol$result))
  expect_equal(result_plot1SplNoFitNoCol$result$labels$x, "Retention Time (sec)")
  expect_equal(result_plot1SplNoFitNoCol$result$labels$y, "Intensity")
  expect_equal(length(result_plot1SplNoFitNoCol$result), 9)
})

test_that('plot feature in 2 samples, change colours and sampling', {
  # generate plot
  result_plot2SplWithCol <- plotEICFit(ROIDataPointSampleList=list(tmp_DataPoints1, tmp_DataPoints2),
                                       curveFitSampleList=list(fit1, fit2),
                                       rtMin=c(995., 997.), rtMax=c(1005.,1007.),
                                       sampling=300, sampleColour=c('blue', 'red'), verbose=FALSE)
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(result_plot2SplWithCol))
  expect_equal(result_plot2SplWithCol$labels$x, "Retention Time (sec)")
  expect_equal(result_plot2SplWithCol$labels$y, "Intensity")
  expect_equal(length(result_plot2SplWithCol), 9)
})

test_that('plot feature in 2 samples, rtMin and/or rtMax have a NA (cannot plot fit)', {
  # generate plot
  result_plot2SplRTNA <- plotEICFit(ROIDataPointSampleList=list(tmp_DataPoints1, tmp_DataPoints2),
                                    curveFitSampleList=list(fit1, fit2),
                                    rtMin=c(NA, 997.), rtMax=c(1005.,NA),
                                    sampling=250, sampleColour=NULL, verbose=FALSE)
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(result_plot2SplRTNA))
  expect_equal(result_plot2SplRTNA$labels$x, "Retention Time (sec)")
  expect_equal(result_plot2SplRTNA$labels$y, "Intensity")
  expect_equal(length(result_plot2SplRTNA), 9)
})

test_that('no rtMin and/or rtMax, cannot plot fit warning', {
  # Expected message
  expected_message  <- c("\"curveFitSampleList\", \"rtMin\" or \"rtMax\" no provided, curveFit will not be plotted\n")
  
  # generate plot
  result_plotFitWarning <- evaluate_promise(plotEICFit(ROIDataPointSampleList=list(tmp_DataPoints1, tmp_DataPoints2),
                                            curveFitSampleList=list(fit1, fit2),
                                            rtMin=NULL, rtMax=NULL,
                                            sampling=250, sampleColour=NULL, verbose=TRUE))
  
  # Check messages confirming the replacements
  expect_equal(result_plotFitWarning$messages, expected_message)
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(result_plotFitWarning$result))
  expect_equal(result_plotFitWarning$result$labels$x, "Retention Time (sec)")
  expect_equal(result_plotFitWarning$result$labels$y, "Intensity")
  expect_equal(length(result_plotFitWarning$result), 9)
})

test_that('sampleColour length warning', {
  # Expected message
  expected_message <- c("Warning: sampleColour length must match the number of samples; default colour used\n")
  
  # generate plot
  result_plotColourWarning <- evaluate_promise(plotEICFit(ROIDataPointSampleList=list(tmp_DataPoints1),
                                                          curveFitSampleList=list(fit1),
                                                          rtMin=995., rtMax=1005., sampling=250,
                                                          sampleColour=c('green','purple'),
                                                          verbose=TRUE))
  
  # check messages confirming the replacements
  expect_equal(result_plotColourWarning$messages, expected_message)
  
  # Check plot properties
  expect_true(ggplot2::is.ggplot(result_plotColourWarning$result))
  expect_equal(result_plotColourWarning$result$labels$x, "Retention Time (sec)")
  expect_equal(result_plotColourWarning$result$labels$y, "Intensity")
  expect_equal(length(result_plotColourWarning$result), 9)
})

test_that('raise errors', {
  # ROIDataPointSampleList is not a list
  msg1    <- c('Error: "ROIDataPointSampleList" must be a list of data.frame')
  expect_error(plotEICFit('not a list', rtMin=995., rtMax=1005., sampling=250, curveFitSampleList=list(fit1), sampleColour=NULL, verbose=FALSE), msg1, fixed=TRUE)
  
  # ROIDataPointSampleList length is wrong
  msg2    <- c('"curveFitSampleList", "rtMin", "rtMax" and "ROIDataPointSampleList" must be the same length')
  expect_error(plotEICFit(list(tmp_DataPoints1, tmp_DataPoints2), curveFitSampleList=list(fit1), rtMin=995., rtMax=1005., sampling=250, sampleColour=NULL, verbose=FALSE), msg2, fixed=TRUE)
  
  # rtMin length is wrong
  msg3    <- c('"curveFitSampleList", "rtMin", "rtMax" and "ROIDataPointSampleList" must be the same length')
  expect_error(plotEICFit(list(tmp_DataPoints1), curveFitSampleList=list(fit1), rtMin=c(995.,997.), rtMax=1005., sampling=250, sampleColour=NULL, verbose=FALSE), msg3, fixed=TRUE)
  
  # rtmMax length is wrong
  msg4    <- c('"curveFitSampleList", "rtMin", "rtMax" and "ROIDataPointSampleList" must be the same length')
  expect_error(plotEICFit(list(tmp_DataPoints1), curveFitSampleList=list(fit1), rtMin=995., rtMax=c(1005., 1006.), sampling=250, sampleColour=NULL, verbose=FALSE), msg4, fixed=TRUE)
  
  # curveFitSampleList length is wrong
  msg5    <- c('"curveFitSampleList", "rtMin", "rtMax" and "ROIDataPointSampleList" must be the same length')
  expect_error(plotEICFit(list(tmp_DataPoints1), curveFitSampleList=list(fit1,fit2), rtMin=995., rtMax=c(1005.,1007.), sampleColour=NULL, verbose=FALSE), msg5, fixed=TRUE)
})
