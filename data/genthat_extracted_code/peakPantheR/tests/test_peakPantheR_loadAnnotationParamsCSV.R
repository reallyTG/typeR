context('peakPantheR_loadAnnotationParamsCSV()')

## Test the generation of a new object by reading parameters from CSV

skip_if(getRversion() >= "3.6")
skip_if_not_installed('faahKO',  minimum_version = '1.18.0')
library(faahKO)


## Input data
input_CSV      <- data.frame(matrix(nrow=2,ncol=21,dimnames=list(c(), c('cpdID', 'cpdName', 'X', 'ROI_rt', 'ROI_mz','ROI_rtMin', 'ROI_rtMax', 'ROI_mzMin', 'ROI_mzMax', 'X', 'uROI_rtMin', 'uROI_rtMax', 'uROI_mzMin', 'uROI_mzMax', 'uROI_rt', 'uROI_mz', 'X', 'FIR_rtMin', 'FIR_rtMax', 'FIR_mzMin', 'FIR_mzMax'))))
input_CSV[1,]  <- c('ID-1', 'Cpd 1', '|', 1.,  2.,  3.,  4.,  5.,  6.,  '|', 7.,  8.,  9.,  10., 11., 12., '|', 13., 14., 15., 16.)
input_CSV[2,]  <- c('ID-2', 'Cpd 2', '|', 17., 18., 19., 20., 21., 22., '|', 23., 24., 25., 26., 27., 28., '|', 29., 30., 31., 32.)
input_CSV[,-c(1,2,3,10,17)]  <- sapply(input_CSV[,-c(1,2,3,10,17)], as.numeric)


## Expected result
# targetFeatTable
input_targetFeatTable     <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
input_targetFeatTable[1,] <- c("ID-1", "Cpd 1",  3.,  1.,  4.,  5.,  2.,  6.)
input_targetFeatTable[2,] <- c("ID-2", "Cpd 2", 19., 17., 20., 21., 18., 22.)
input_targetFeatTable[,c(3:8)] <- sapply(input_targetFeatTable[,c(3:8)], as.numeric)

# uROI
input_uROI      <- data.frame(matrix(vector(), 2, 6, dimnames=list(c(), c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
input_uROI[1,]  <- c( 7., 11. , 8.,  9., 12., 10.)
input_uROI[2,]  <- c(23., 27., 24., 25., 28., 26.)

# FIR
input_FIR       <- data.frame(matrix(vector(), 2, 4, dimnames=list(c(), c("rtMin", "rtMax", "mzMin", "mzMax"))), stringsAsFactors=F)
input_FIR[1,]   <- c(13., 14., 15., 16.)
input_FIR[2,]   <- c(29., 30., 31., 32.)

# object
input_annotation  <- peakPantheRAnnotation(targetFeatTable = input_targetFeatTable,
                                           uROI = input_uROI, 
                                           FIR = input_FIR,
                                           uROIExist = TRUE)



test_that('default with ROI, uROI, FIR, uROIExist=TRUE, verbose, no verbose', {
  # temporary file
  savePath1           <- tempfile(pattern="file", tmpdir=tempdir(), fileext='.csv')
  
  # save csv
  utils::write.csv(input_CSV, file=savePath1, row.names=FALSE)
  
  # expected
  expected_annotation <- input_annotation
  expected_message    <- c("uROIExist set to TRUE\n", "New peakPantheRAnnotation object initialised for 2 compounds\n")
  
  # results (output, warnings and messages)
  result_load1        <- evaluate_promise(peakPantheR_loadAnnotationParamsCSV(savePath1, verbose=TRUE))
  
  # Check result
  expect_equal(result_load1$result, expected_annotation)
  
  # Check result messages
  expect_equal(length(result_load1$messages), 2)
  expect_equal(result_load1$messages, expected_message)
  
  ## no verbose
  result_load2        <- evaluate_promise(peakPantheR_loadAnnotationParamsCSV(savePath1, verbose=FALSE))
  expect_equal(length(result_load2$messages), 0)
})

test_that('ROI with NA, uROI with NA, FIR with NA, uROIExist=FALSE, verbose, no verbose', {
  # NA in ROI_rt mz are allowed, NA in uROI set uROIExist=FALSE, NA in FIR is allowed
  
  # temporary file
  savePath2           <- tempfile(pattern="file", tmpdir=tempdir(), fileext='.csv')
  
  # save csv
  tmp_CSV             <- input_CSV
  tmp_CSV$ROI_rt      <- c(as.numeric(NA), 17.)
  tmp_CSV$ROI_mz      <- c(2, as.numeric(NA))
  tmp_CSV$uROI_rtMin  <- c(7., as.numeric(NA))
  tmp_CSV$FIR_mzMax   <- c(as.numeric(NA), as.numeric(NA))
  utils::write.csv(tmp_CSV, file=savePath2, row.names=FALSE)
  
  # expected
  tmp_targetFeatTable     <- input_targetFeatTable
  tmp_targetFeatTable$rt  <- c(as.numeric(NA), 17.)
  tmp_targetFeatTable$mz  <- c(2, as.numeric(NA))
  tmp_uROI                <- input_uROI
  tmp_uROI$rtMin          <- c(7., as.numeric(NA))
  tmp_FIR                 <- input_FIR
  tmp_FIR$mzMax           <- c(as.numeric(NA), as.numeric(NA))
  expected_annotation     <- peakPantheRAnnotation(targetFeatTable=tmp_targetFeatTable, uROI=tmp_uROI, FIR=tmp_FIR, uROIExist=FALSE)
  expected_message        <- c("NA in uROI, uROIExist is set to FALSE\n", "New peakPantheRAnnotation object initialised for 2 compounds\n")
  
  # results (output, warnings and messages)
  result_load1        <- evaluate_promise(peakPantheR_loadAnnotationParamsCSV(savePath2, verbose=TRUE))
  
  # Check result
  expect_equal(result_load1$result, expected_annotation)
  
  # Check result messages
  expect_equal(length(result_load1$messages), 2)
  expect_equal(result_load1$messages, expected_message)
  
  ## no verbose
  result_load2        <- evaluate_promise(peakPantheR_loadAnnotationParamsCSV(savePath2, verbose=FALSE))
  expect_equal(length(result_load2$messages), 0)
})

test_that('raise errors', {
  # file doesn't exist
  noFile  <- tempfile(pattern="file", tmpdir=tempdir(), fileext='.csv')
  msg1    <- paste('specified "CSVParamPath" does not exist', sep='')
  expect_error(peakPantheR_loadAnnotationParamsCSV(noFile, verbose=TRUE), msg1, fixed=TRUE)
  
  # expected columns are missing
  wrongCol  <- tempfile(pattern="file", tmpdir=tempdir(), fileext='.csv')
  tmp_CSV   <- data.frame(matrix(nrow=2,ncol=2,dimnames=list(c(), c('wrongCol','notAColumn'))))
  utils::write.csv(tmp_CSV, file=wrongCol, row.names=FALSE)
  msg2      <- paste('Columns in "CSVParamPath" must be: "cpdID", "cpdName", "ROI_rt", "ROI_mz", "ROI_rtMin", "ROI_rtMax", "ROI_mzMin", "ROI_mzMax", "uROI_rtMin", "uROI_rtMax", "uROI_mzMin", "uROI_mzMax", "uROI_rt", "uROI_mz", "FIR_rtMin", "FIR_rtMax", "FIR_mzMin", "FIR_mzMax"')
  expect_error(peakPantheR_loadAnnotationParamsCSV(wrongCol, verbose=TRUE), msg2, fixed=TRUE)
})
