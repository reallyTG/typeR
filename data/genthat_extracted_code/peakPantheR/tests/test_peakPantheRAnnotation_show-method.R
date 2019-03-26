context('peakPantheRAnnotation_show-method()')

# Test the show method

test_that('show method outputs right value', {
  # Input and expected
  input_spectraPaths        <- c('./path/file1', './path/file2', './path/file3')
  input_targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
  input_targetFeatTable[1,] <- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
  input_targetFeatTable[2,] <- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
  input_targetFeatTable[,c(3:8)]  <- sapply(input_targetFeatTable[,c(3:8)], as.numeric)
  input_FIR       <- data.frame(matrix(vector(), 2, 4, dimnames=list(c(), c("rtMin", "rtMax", "mzMin", "mzMax"))), stringsAsFactors=F)
  input_FIR[1,]   <- c(1., 2., 3., 4.)
  input_FIR[2,]   <- c(5., 6., 7., 8.)
  input_uROI      <- data.frame(matrix(vector(), 2, 6, dimnames=list(c(), c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
  input_uROI[1,]  <- c(10., 11., 12., 13., 14., 15.)
  input_uROI[2,]  <- c(16., 17., 18., 19., 20., 21.)
  expected_msg_default    <- "An object of class peakPantheRAnnotation\n 0 compounds in 0 samples. \n  updated ROI do not exist (uROI)\n  does not use updated ROI (uROI)\n  does not use fallback integration regions (FIR)\n  is not annotated"
  expected_msg_ROIFIRInit <- "An object of class peakPantheRAnnotation\n 2 compounds in 3 samples. \n  updated ROI exist (uROI)\n  uses updated ROI (uROI)\n  uses fallback integration regions (FIR)\n  is annotated"

  # default values, no uROI, no use of FIR
  defaultInit     <- peakPantheRAnnotation()
  result_default  <- evaluate_promise(show(defaultInit))
  expect_equal(result_default$output, expected_msg_default)

  # multiple compounds and spectra with uROIExist and useFIR
  ROIFIRInit        <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, targetFeatTable=input_targetFeatTable, uROI=input_uROI, FIR=input_FIR, uROIExist=TRUE, useUROI=TRUE, useFIR=TRUE, isAnnotated=TRUE)
  result_ROIFIRInit <- evaluate_promise(show(ROIFIRInit))
  expect_equal(result_ROIFIRInit$output, expected_msg_ROIFIRInit)
})

