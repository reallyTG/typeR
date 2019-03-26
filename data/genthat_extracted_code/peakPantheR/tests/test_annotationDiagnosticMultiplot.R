context('annotationDiagnosticMultiplot()')

## Test the generation of multiplot for each compound

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

# acquisitionTime
input_acquisitionTime <- c(Sys.time(), Sys.time()+900, Sys.time()+1800)

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

# input annotationDiagnosticPlotList
# compound 1
expected_EICFit1                  <- plotEICFit(ROIDataPointSampleList = list(ROIDataPoints1[[1]], ROIDataPoints2[[1]], ROIDataPoints3[[1]]),
                                                curveFitSampleList = list(cFit1.1, cFit1.2, cFit1.2),
                                                rtMin = c(3309.7589296586070, 3326.1063495851854, 3333.8625894557053),
                                                rtMax = c(3385.4098874628098, 3407.2726475892355, 3407.4362838927614),
                                                sampling = 250,
                                                sampleColour = NULL,
                                                verbose = FALSE)
expected_rtPeakwidthVert1         <- plotPeakwidth(apexValue = c(3346.8277590361445, 3365.102, 3368.233),
                                                   widthMin = c(3309.7589296586070, 3326.1063495851854, 3333.8625894557053),
                                                   widthMax = c(3385.4098874628098, 3407.2726475892355, 3407.4362838927614),
                                                   acquTime = input_acquisitionTime,
                                                   sampleColour = NULL,
                                                   varName = 'Retention Time (sec)',
                                                   rotateAxis = TRUE,
                                                   verbose = FALSE)
expected_rtPeakwidthHorzRunOrder1 <- plotPeakwidth(apexValue = c(3346.8277590361445, 3365.102, 3368.233),
                                                   widthMin = c(3309.7589296586070, 3326.1063495851854, 3333.8625894557053),
                                                   widthMax = c(3385.4098874628098, 3407.2726475892355, 3407.4362838927614),
                                                   acquTime = input_acquisitionTime,
                                                   sampleColour = NULL,
                                                   varName = 'Retention Time (sec)',
                                                   rotateAxis = FALSE,
                                                   verbose = FALSE)
expected_mzPeakwidthHorzRunOrder1 <- plotPeakwidth(apexValue = c(522.20001220703125, 522.20001220703125, 522.20001220703125),
                                                   widthMin = c(522.194778, 522.194778, 522.194778),
                                                   widthMax = c(522.205222, 522.205222, 522.205222),
                                                   acquTime = input_acquisitionTime,
                                                   sampleColour = NULL,
                                                   varName = 'm/z',
                                                   rotateAxis = FALSE,
                                                   verbose = FALSE)
expected_areaRunOrder1            <- plotPeakwidth(apexValue = c(26133726.681124408, 24545301.622835573, 21447174.404490683),
                                                   widthMin = NULL,
                                                   widthMax = NULL,
                                                   acquTime = input_acquisitionTime,
                                                   sampleColour = NULL,
                                                   varName = 'Peak Area',
                                                   rotateAxis = FALSE,
                                                   verbose = FALSE)
expected_rtHistogram1             <- plotHistogram(var = c(3346.8277590361445, 3365.102, 3368.233), 
                                                   varName='Retention Time (sec)',
                                                   density=TRUE)
expected_mzHistogram1             <- plotHistogram(var = c(522.20001220703125, 522.20001220703125, 522.20001220703125),
                                                   varName='m/z',
                                                   density=TRUE)
expected_areaHistogram1           <- plotHistogram(var = c(26133726.681124408, 24545301.622835573, 21447174.404490683),
                                                   varName='Peak Area', 
                                                   density=TRUE)
# compound 2
expected_EICFit2                  <- plotEICFit(ROIDataPointSampleList = list(ROIDataPoints1[[2]], ROIDataPoints2[[2]], ROIDataPoints3[[2]]),
                                                curveFitSampleList = list(cFit1.2, cFit2.2, cFit3.2),
                                                rtMin = c(3345.3766648628907, 3365.0238566258713, 3373.3998828113113),
                                                rtMax = c(3428.2788374983961, 3453.4049569205681, 3454.4490330927388),
                                                sampling = 250,
                                                sampleColour = NULL,
                                                verbose = FALSE)
expected_rtPeakwidthVert2         <- plotPeakwidth(apexValue = c(3386.5288072289159, 3405.791, 3413.4952530120481),
                                                   widthMin = c(3345.3766648628907, 3365.0238566258713, 3373.3998828113113),
                                                   widthMax = c(3428.2788374983961, 3453.4049569205681, 3454.4490330927388),
                                                   acquTime = NULL,
                                                   sampleColour = NULL,
                                                   varName = 'Retention Time (sec)',
                                                   rotateAxis = TRUE,
                                                   verbose = FALSE)
expected_rtPeakwidthHorzRunOrder2 <- plotPeakwidth(apexValue = c(3386.5288072289159, 3405.791, 3413.4952530120481),
                                                   widthMin = c(3345.3766648628907, 3365.0238566258713, 3373.3998828113113),
                                                   widthMax = c(3428.2788374983961, 3453.4049569205681, 3454.4490330927388),
                                                   acquTime = input_acquisitionTime,
                                                   sampleColour = NULL,
                                                   varName = 'Retention Time (sec)',
                                                   rotateAxis = FALSE,
                                                   verbose = FALSE)
expected_mzPeakwidthHorzRunOrder2 <- plotPeakwidth(apexValue = c(496.20001220703125, 496.20001220703125, 496.20001220703125),
                                                   widthMin = c(496.20001220703125, 496.195038, 496.195038),
                                                   widthMax = c(496.20001220703125, 496.204962, 496.204962),
                                                   acquTime = input_acquisitionTime,
                                                   sampleColour = NULL,
                                                   varName = 'm/z',
                                                   rotateAxis = FALSE,
                                                   verbose = FALSE)
expected_areaRunOrder2            <- plotPeakwidth(apexValue = c(35472141.333024293, 37207579.286265120, 35659353.614476241),
                                                   widthMin = NULL,
                                                   widthMax = NULL,
                                                   acquTime = input_acquisitionTime,
                                                   sampleColour = NULL,
                                                   varName = 'Peak Area',
                                                   rotateAxis = FALSE,
                                                   verbose = FALSE)
expected_rtHistogram2             <- plotHistogram(var = c(3386.5288072289159, 3405.791, 3413.4952530120481), 
                                                   varName='Retention Time (sec)',
                                                   density=TRUE)
expected_mzHistogram2             <- plotHistogram(var = c(496.20001220703125, 496.20001220703125, 496.20001220703125),
                                                   varName='m/z',
                                                   density=TRUE)
expected_areaHistogram2           <- plotHistogram(var = c(35472141.333024293, 37207579.286265120, 35659353.614476241),
                                                   varName='Peak Area', 
                                                   density=TRUE)
# annotationDiagnosticPlotList
input_annotationDiagnosticPlotList <- list(list(EICFit = expected_EICFit1, 
                                                rtPeakwidthVert = expected_rtPeakwidthVert1, 
                                                rtPeakwidthHorzRunOrder = expected_rtPeakwidthHorzRunOrder1,
                                                mzPeakwidthHorzRunOrder = expected_mzPeakwidthHorzRunOrder1,
                                                areaRunOrder = expected_areaRunOrder1,
                                                rtHistogram = expected_rtHistogram1,
                                                mzHistogram = expected_mzHistogram1,
                                                areaHistogram = expected_areaHistogram1,
                                                title = 'test compound 1'),
                                           list(EICFit = expected_EICFit2, 
                                                rtPeakwidthVert = expected_rtPeakwidthVert2, 
                                                rtPeakwidthHorzRunOrder = expected_rtPeakwidthHorzRunOrder2,
                                                mzPeakwidthHorzRunOrder = expected_mzPeakwidthHorzRunOrder2,
                                                areaRunOrder = expected_areaRunOrder2,
                                                rtHistogram = expected_rtHistogram2,
                                                mzHistogram = expected_mzHistogram2,
                                                areaHistogram = expected_areaHistogram2,
                                                title = 'test compound 2'))



test_that('default multiplot', {
  # input
  input_plots       <- input_annotationDiagnosticPlotList
  # expected
  gtable_class      <- sort(c("gtable", "gTree", "grob", "gDesc"))
  
  # results (output, warnings and messages)
  result_multiplot  <- evaluate_promise(annotationDiagnosticMultiplot(input_plots))

  # Check plots generated
  expect_equal(length(result_multiplot$result), 2)
  expect_equal(sort(class(result_multiplot$result[[1]])), gtable_class)
  expect_equal(length(result_multiplot$result[[1]]), 9)
  expect_equal(sort(class(result_multiplot$result[[2]])), gtable_class)
  expect_equal(length(result_multiplot$result[[2]]), 9)
})

test_that('raise warnings/error', {
  # expected
  gtable_class      <- sort(c("gtable", "gTree", "grob", "gDesc"))
  expected_message  <- "Required plots missing for compound #1\n"
  
  # missing EICFit for cpd 1
  input_missEICFit      <- input_annotationDiagnosticPlotList
  input_missEICFit[[1]] <- input_missEICFit[[1]][c("rtPeakwidthVert", "rtPeakwidthHorzRunOrder", "mzPeakwidthHorzRunOrder", "areaRunOrder", "rtHistogram", "mzHistogram", "areaHistogram", "title")]
  result_warn1          <- evaluate_promise(annotationDiagnosticMultiplot(input_missEICFit))
  expect_equal(result_warn1$message[[1]], expected_message)
  expect_equal(result_warn1$result[[1]], NULL)
  expect_equal(sort(class(result_warn1$result[[2]])), gtable_class)
  expect_equal(length(result_warn1$result[[2]]), 9)
  
  # missing rtPeakwidthVert for cpd 1
  input_missrtPeakwidthVert       <- input_annotationDiagnosticPlotList
  input_missrtPeakwidthVert[[1]]  <- input_missrtPeakwidthVert[[1]][c("EICFit", "rtPeakwidthHorzRunOrder", "mzPeakwidthHorzRunOrder", "areaRunOrder", "rtHistogram", "mzHistogram", "areaHistogram", "title")]
  result_warn2                    <- evaluate_promise(annotationDiagnosticMultiplot(input_missrtPeakwidthVert))
  expect_equal(result_warn2$message[[1]], expected_message)
  expect_equal(result_warn2$result[[1]], NULL)
  expect_equal(sort(class(result_warn2$result[[2]])), gtable_class)
  expect_equal(length(result_warn2$result[[2]]), 9)
  
  # missing rtPeakwidthHorzRunOrder for cpd 1
  input_missrtPeakwidthHorzRunOrder       <- input_annotationDiagnosticPlotList
  input_missrtPeakwidthHorzRunOrder[[1]]  <- input_missrtPeakwidthHorzRunOrder[[1]][c("EICFit", "rtPeakwidthVert", "mzPeakwidthHorzRunOrder", "areaRunOrder", "rtHistogram", "mzHistogram", "areaHistogram", "title")]
  result_warn3                            <- evaluate_promise(annotationDiagnosticMultiplot(input_missrtPeakwidthHorzRunOrder))
  expect_equal(result_warn3$message[[1]], expected_message)
  expect_equal(result_warn3$result[[1]], NULL)
  expect_equal(sort(class(result_warn3$result[[2]])), gtable_class)
  expect_equal(length(result_warn3$result[[2]]), 9)
  
  # missing mzPeakwidthHorzRunOrder for cpd 1
  input_missmzPeakwidthHorzRunOrder       <- input_annotationDiagnosticPlotList
  input_missmzPeakwidthHorzRunOrder[[1]]  <- input_missmzPeakwidthHorzRunOrder[[1]][c("EICFit", "rtPeakwidthVert", "rtPeakwidthHorzRunOrder", "areaRunOrder", "rtHistogram", "mzHistogram", "areaHistogram")]
  result_warn4                            <- evaluate_promise(annotationDiagnosticMultiplot(input_missmzPeakwidthHorzRunOrder))
  expect_equal(result_warn4$message[[1]], expected_message)
  expect_equal(result_warn4$result[[1]], NULL)
  expect_equal(sort(class(result_warn4$result[[2]])), gtable_class)
  expect_equal(length(result_warn4$result[[2]]), 9)
  
  # missing areaRunOrder for cpd 1
  input_missareaRunOrder      <- input_annotationDiagnosticPlotList
  input_missareaRunOrder[[1]] <- input_missareaRunOrder[[1]][c("EICFit", "rtPeakwidthVert", "rtPeakwidthHorzRunOrder", "mzPeakwidthHorzRunOrder", "rtHistogram", "mzHistogram", "areaHistogram", "title")]
  result_warn5                <- evaluate_promise(annotationDiagnosticMultiplot(input_missareaRunOrder))
  expect_equal(result_warn5$message[[1]], expected_message)
  expect_equal(result_warn5$result[[1]], NULL)
  expect_equal(sort(class(result_warn5$result[[2]])), gtable_class)
  expect_equal(length(result_warn5$result[[2]]), 9)
  
  # missing rtHistogram for cpd 1
  input_missrtHistogram      <- input_annotationDiagnosticPlotList
  input_missrtHistogram[[1]] <- input_missrtHistogram[[1]][c("EICFit", "rtPeakwidthVert", "rtPeakwidthHorzRunOrder", "mzPeakwidthHorzRunOrder", "areaRunOrder", "mzHistogram", "areaHistogram", "title")]
  result_warn6                <- evaluate_promise(annotationDiagnosticMultiplot(input_missrtHistogram))
  expect_equal(result_warn6$message[[1]], expected_message)
  expect_equal(result_warn6$result[[1]], NULL)
  expect_equal(sort(class(result_warn6$result[[2]])), gtable_class)
  expect_equal(length(result_warn6$result[[2]]), 9)
  
  # missing mzHistogram for cpd 1
  input_missmzHistogram      <- input_annotationDiagnosticPlotList
  input_missmzHistogram[[1]] <- input_missmzHistogram[[1]][c("EICFit", "rtPeakwidthVert", "rtPeakwidthHorzRunOrder", "mzPeakwidthHorzRunOrder", "areaRunOrder", "rtHistogram", "areaHistogram", "title")]
  result_warn7                <- evaluate_promise(annotationDiagnosticMultiplot(input_missmzHistogram))
  expect_equal(result_warn7$message[[1]], expected_message)
  expect_equal(result_warn7$result[[1]], NULL)
  expect_equal(sort(class(result_warn7$result[[2]])), gtable_class)
  expect_equal(length(result_warn7$result[[2]]), 9)
  
  # missing areaHistogram for cpd 1
  input_missareaHistogram      <- input_annotationDiagnosticPlotList
  input_missareaHistogram[[1]] <- input_missareaHistogram[[1]][c("EICFit", "rtPeakwidthVert", "rtPeakwidthHorzRunOrder", "mzPeakwidthHorzRunOrder", "areaRunOrder", "rtHistogram", "mzHistogram", "title")]
  result_warn8                <- evaluate_promise(annotationDiagnosticMultiplot(input_missareaHistogram))
  expect_equal(result_warn8$message[[1]], expected_message)
  expect_equal(result_warn8$result[[1]], NULL)
  expect_equal(sort(class(result_warn8$result[[2]])), gtable_class)
  expect_equal(length(result_warn8$result[[2]]), 9)
  
  # missing title for cpd 1
  input_missareaHistogram      <- input_annotationDiagnosticPlotList
  input_missareaHistogram[[1]] <- input_missareaHistogram[[1]][c("EICFit", "rtPeakwidthVert", "rtPeakwidthHorzRunOrder", "mzPeakwidthHorzRunOrder", "areaRunOrder", "rtHistogram", "mzHistogram", "areaHistogram")]
  result_warn8                <- evaluate_promise(annotationDiagnosticMultiplot(input_missareaHistogram))
  expect_equal(result_warn8$message[[1]], expected_message)
  expect_equal(result_warn8$result[[1]], NULL)
  expect_equal(sort(class(result_warn8$result[[2]])), gtable_class)
  expect_equal(length(result_warn8$result[[2]]), 9)
})
