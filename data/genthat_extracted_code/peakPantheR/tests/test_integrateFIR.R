context('integrateFIR()')

skip_if(getRversion() >= "3.6")
skip_if_not_installed('faahKO',  minimum_version = '1.18.0')
library(faahKO)


## Input and expected data
# use ko15.CDf file from the pkg faahKO
raw_data <- MSnbase::readMSData( system.file('cdf/KO/ko15.CDF', package = "faahKO"), centroided=TRUE, mode='onDisk')

# full peakTable
full_peakTable     <- data.frame(matrix(vector(), 4, 17, dimnames=list(c(), c("found", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax", "peakArea", "maxIntMeasured", "maxIntPredicted", "cpdID", "cpdName", "is_filled", "ppm_error", "rt_dev_sec", "tailingFactor", "asymmetryFactor"))),stringsAsFactors=F)
full_peakTable[1,] <- c(TRUE, 3309.7589296586070, 3346.8277590361445, 3385.4098874628098, 522.2, 522.2, 522.2, 26133726.6811244078, 889280, 901015.80529226747, 'ID-1', 'testCpd 1', FALSE, 0.023376160866574614, 1.93975903614455092, 1.0153573486330891, 1.0268238825675249)
full_peakTable[2,] <- c(TRUE, 3345.3766648628907, 3386.5288072289159, 3428.2788374983961, 496.2, 496.2, 496.2, 35472141.3330242932, 1128960, 1113576.69008227298, 'ID-2', 'testCpd 2', FALSE, 0.024601030353423384, 0.95180722891564074, 1.0053782620427065, 1.0093180792278085)
full_peakTable[3,] <- c(TRUE, 3451.2075903614455, 3451.5072891566265, 3501.6697504924518, 464.2, 464.2, 464.2, 7498427.1583901159, 380736, 389632.13549519412, 'ID-3', 'testCpd 3', FALSE, 0.026296922148575364, 2.92771084337346110, 207.6939219686769036, 380.5019028782010082)
full_peakTable[4,] <- c(TRUE, 3670.9201232710743, 3704.1427831325304, 3740.0172511251831, 536.2, 536.2, 536.2, 8626279.9788195733, 330176, 326763.87246511364, 'ID-4', 'testCpd 4', FALSE, 0.022765817240815486, 2.44578313253032320, 1.0305289730128095, 1.0536948855480386)
full_peakTable[,c(1,13)]       <- sapply(full_peakTable[,c(1,13)], as.logical)
full_peakTable[,c(2:10,14:17)] <- sapply(full_peakTable[,c(2:10,14:17)], as.numeric)

# FIR (matching found peaks dimension, need widening mz as test data doesn't result in mz width)
input_FIR           <- full_peakTable[,c("mzMin", "mzMax", "rtMin", "rtMax")]
input_FIR$mzMin     <- input_FIR$mzMin - 0.0005
input_FIR$mzMax     <- input_FIR$mzMax + 0.0005


test_that('no modification, no missing, no verbose', {
  # Expected peakTable
  expected_peakTable  <- full_peakTable

  # results (output, warnings and messages)
  result_integrateFIR <- evaluate_promise(integrateFIR(rawSpec=raw_data, foundPeakTable=full_peakTable, FIR=input_FIR, verbose=TRUE))

  # Check results
  expect_equal(result_integrateFIR$result, expected_peakTable)

  # Check messages (timing)
  expect_equal(length(result_integrateFIR$messages), 1)
})

test_that('3 missing with 1 which gives no scan, verbose', {
  # Input FIR with 1 empty box (without the widened mz cpd 3 should not return any matching scan)
  input_FIR_empty                     <- input_FIR
  input_FIR_empty[3,]                 <- full_peakTable[3,c("mzMin", "mzMax", "rtMin", "rtMax")]
  # Input peakTable (with 2, 3, 4 not found)
  notFound_peakTable                  <- full_peakTable
  notFound_peakTable[2,c(1:10,14:17)] <- c(FALSE, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
  notFound_peakTable[3,c(1:10,14:17)] <- c(FALSE, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
  notFound_peakTable[4,c(1:10,14:17)] <- c(FALSE, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
  # Expected peakTable
  expected_peakTable                  <- full_peakTable
  expected_peakTable[2,c(1:10,13:17)] <- c(TRUE, 3345.3766648628898, 3385.577, 3428.2788374984002, 496.1995, 496.20001220703125, 496.2005, 35927484.16483026, 1128960, as.numeric(NA), TRUE, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  expected_peakTable[3,c(1:10,13:17)] <- c(TRUE, 3451.20759036145, 3476.4386704269500, 3501.66975049245, 464.2, 464.2, 464.2, 0, 0, 0, TRUE, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  expected_peakTable[4,c(1:10,13:17)] <- c(TRUE, 3670.9201232710702, 3701.697, 3740.0172511251799, 536.1995, 536.20001220703125, 536.2005, 8902290.3072856702, 330176, as.numeric(NA), TRUE, as.numeric(NA), as.numeric(NA), as.numeric(NA), as.numeric(NA))
  expected_peakTable[,c(1,13)]        <- sapply(expected_peakTable[,c(1,13)], as.logical)
  # Expected message
  expected_messages                   <- c("3 features to integrate with FIR\n", "Reading data from 3 windows\n", "No scan present in the FIR # 3: rt and mz are set as the middle of the FIR box; peakArea, maxIntMeasured and maxIntPredicted are set to 0\n")

  # results (output, warnings and messages)
  result_integrateFIR           <- evaluate_promise(integrateFIR(rawSpec=raw_data, foundPeakTable=notFound_peakTable, FIR=input_FIR_empty, verbose=TRUE))

  # Check results
  expect_equal(result_integrateFIR$result, expected_peakTable)

  # Check messages (cannot check time on message)
  expect_equal(length(result_integrateFIR$messages), 5)
  expect_equal(result_integrateFIR$messages[c(1,2,4)], expected_messages)
})

test_that('raise errors', {
  # paths to trigger errors
  wrongFIRsize    <- input_FIR[1:3,]

  # foundPeakTable and FIR dimension mismatch
  expect_error(integrateFIR(rawSpec=raw_data, foundPeakTable=full_peakTable, FIR=wrongFIRsize, verbose=TRUE), "Check input, FIR must have the same number of rows as foundPeakTable")
})


