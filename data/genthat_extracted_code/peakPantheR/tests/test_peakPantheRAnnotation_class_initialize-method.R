context('peakPantheRAnnotation_class_initializeMethod()')

# Test the class definition (enforces default slot type)
# Test initialize method (set default values, initialisation from spectraPaths and targetFeatTable)

test_that('initialize with default values', {
  # Expected values
  expected_slotName <- c("cpdID", "cpdName", "ROI", "FIR", "uROI", "filepath", "cpdMetadata", "spectraMetadata", "acquisitionTime", "uROIExist", "useUROI", "useFIR", "TIC", "peakTables", "dataPoints", "peakFit", "isAnnotated")
  expected_ROI              <- data.frame(rtMin=numeric(), rt=numeric(), rtMax=numeric(), mzMin=numeric(), mz=numeric(), mzMax=numeric(), stringsAsFactors=F)
  expected_FIR              <- data.frame(rtMin=numeric(), rtMax=numeric(), mzMin=numeric(), mzMax=numeric(), stringsAsFactors=F)
  expected_uROI             <- data.frame(rtMin=numeric(), rt=numeric(), rtMax=numeric(), mzMin=numeric(), mz=numeric(), mzMax=numeric(), stringsAsFactors=F)
  expected_cpdMetadata      <- data.frame(matrix(, nrow=0, ncol=0))
  expected_spectraMetadata  <- data.frame(matrix(, nrow=0, ncol=0))

  # Object initialised with default values
  defaultInit <- peakPantheRAnnotation()

  # Check object
  expect_true(class(defaultInit) == "peakPantheRAnnotation")
  expect_equal(slotNames(defaultInit), expected_slotName)
  expect_true(is.character(defaultInit@cpdID))
  expect_equal(length(defaultInit@cpdID), 0)
  expect_true(is.character(defaultInit@cpdName))
  expect_equal(length(defaultInit@cpdName), 0)
  expect_equal(defaultInit@ROI, expected_ROI)
  expect_equal(defaultInit@FIR, expected_FIR)
  expect_equal(defaultInit@uROI, expected_uROI)
  expect_true(is.character(defaultInit@filepath))
  expect_equal(defaultInit@cpdMetadata, expected_cpdMetadata)
  expect_equal(defaultInit@spectraMetadata, expected_spectraMetadata)
  expect_equal(length(defaultInit@filepath), 0)
  expect_true(is.character(defaultInit@acquisitionTime))
  expect_equal(length(defaultInit@acquisitionTime), 0)
  expect_false(defaultInit@uROIExist)
  expect_false(defaultInit@useUROI)
  expect_false(defaultInit@useFIR)
  expect_true(is.numeric(defaultInit@TIC))
  expect_equal(length(defaultInit@TIC), 0)
  expect_true(is.list(defaultInit@peakTables))
  expect_equal(length(defaultInit@peakTables), 0)
  expect_true(is.list(defaultInit@dataPoints))
  expect_equal(length(defaultInit@dataPoints), 0)
  expect_true(is.list(defaultInit@peakFit))
  expect_equal(length(defaultInit@peakFit), 0)
  expect_false(defaultInit@isAnnotated)
})

test_that('slot types are set in class definition', {
  # slot cpdID is not character
  msg1 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "cpdID" in class "peakPantheRAnnotation": got class "numeric", should be or extend class "character"', sep='')
  expect_error(peakPantheRAnnotation(cpdID=5), msg1, fixed=TRUE)
  # slot cpdName is not character
  msg2 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "cpdName" in class "peakPantheRAnnotation": got class "numeric", should be or extend class "character"', sep='')
  expect_error(peakPantheRAnnotation(cpdName=5), msg2, fixed=TRUE)
  # slot ROI is not a data.frame
  msg3 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "ROI" in class "peakPantheRAnnotation": got class "character", should be or extend class "data.frame"', sep='')
  expect_error(peakPantheRAnnotation(ROI='notADataFrame'), msg3, fixed=TRUE)
  # slot FIR is not a data.frame
  msg4 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "FIR" in class "peakPantheRAnnotation": got class "character", should be or extend class "data.frame"', sep='')
  expect_error(peakPantheRAnnotation(FIR='notADataFrame'), msg4, fixed=TRUE)
  # slot uROI is not a data.frame
  msg5 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "uROI" in class "peakPantheRAnnotation": got class "character", should be or extend class "data.frame"', sep='')
  expect_error(peakPantheRAnnotation(uROI='notADataFrame'), msg5, fixed=TRUE)
  # slot filepath is not character
  msg6 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "filepath" in class "peakPantheRAnnotation": got class "numeric", should be or extend class "character"', sep='')
  expect_error(peakPantheRAnnotation(filepath=5), msg6, fixed=TRUE)
  # slot acquisitionTime is not character
  msg7 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "acquisitionTime" in class "peakPantheRAnnotation": got class "numeric", should be or extend class "character"', sep='')
  expect_error(peakPantheRAnnotation(acquisitionTime=5), msg7, fixed=TRUE)
  # slot uROIExist is not a logical
  msg8 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "uROIExist" in class "peakPantheRAnnotation": got class "character", should be or extend class "logical"', sep='')
  expect_error(peakPantheRAnnotation(uROIExist='notALogical'), msg8, fixed=TRUE)
  # slot useUROI is not a logical
  msg9 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "useUROI" in class "peakPantheRAnnotation": got class "character", should be or extend class "logical"', sep='')
  expect_error(peakPantheRAnnotation(useUROI='notALogical'), msg9, fixed=TRUE)
  # slot useFIR is not a logical
  msg10 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "useFIR" in class "peakPantheRAnnotation": got class "character", should be or extend class "logical"', sep='')
  expect_error(peakPantheRAnnotation(useFIR='notALogical'), msg10, fixed=TRUE)
  # slot TIC is not numeric
  msg11 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "TIC" in class "peakPantheRAnnotation": got class "character", should be or extend class "numeric"', sep='')
  expect_error(peakPantheRAnnotation(TIC='notNumeric'), msg11, fixed=TRUE)
  # slot peakTables is not a list
  msg12 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "peakTables" in class "peakPantheRAnnotation": got class "character", should be or extend class "list"', sep='')
  expect_error(peakPantheRAnnotation(peakTables='notAList'), msg12, fixed=TRUE)
  # slot dataPoints is not a list
  msg13 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "dataPoints" in class "peakPantheRAnnotation": got class "character", should be or extend class "list"', sep='')
  expect_error(peakPantheRAnnotation(dataPoints='notAList'), msg13, fixed=TRUE)
  # slot peakFit is not a list
  msg14 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "peakFit" in class "peakPantheRAnnotation": got class "character", should be or extend class "list"', sep='')
  expect_error(peakPantheRAnnotation(peakFit='notAList'), msg14, fixed=TRUE)
  # slot isAnnotated is not a logical
  msg15 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "isAnnotated" in class "peakPantheRAnnotation": got class "character", should be or extend class "logical"', sep='')
  expect_error(peakPantheRAnnotation(isAnnotated='notALogical'), msg15, fixed=TRUE)
  # slot cpdMetadata is not a data.frame
  msg16 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "cpdMetadata" in class "peakPantheRAnnotation": got class "character", should be or extend class "data.frame"', sep='')
  expect_error(peakPantheRAnnotation(cpdMetadata='notADataframe'), msg16, fixed=TRUE)
  # slot spectraMetadata is not a data.frame
  msg17 <- paste('invalid class ', dQuote('peakPantheRAnnotation'),' object: invalid object for slot "spectraMetadata" in class "peakPantheRAnnotation": got class "character", should be or extend class "data.frame"', sep='')
  expect_error(peakPantheRAnnotation(spectraMetadata='notADataframe'), msg17, fixed=TRUE)
})

test_that('initialize with spectraPaths', {
  # Input and expected values
  tmp_peakTables            <-  data.frame(matrix(vector(), 0, 15, dimnames=list(c(), c('found', 'rt', 'rtMin', 'rtMax', 'mz', 'mzMin', 'mzMax', 'peakArea', 'maxIntMeasured', 'maxIntPredicted', 'is_filled', 'ppm_error', 'rt_dev_sec', 'tailingFactor', 'asymmetryFactor'))), stringsAsFactors=F)
  input_spectraPaths        <- c('./path/file1', './path/file2', './path/file3')
  input_spectraMetadata     <- data.frame(matrix(data=c('a','b','c'), nrow=3, ncol=1, dimnames=list(c(),c('testcol')), byrow=TRUE), stringsAsFactors=FALSE)
  input_acquisitionTime     <- c(as.character(Sys.time()), as.character(Sys.time()+900), as.character(Sys.time()+1800))
  input_TIC                 <- c(1, 2, 3)
  input_peakTables          <- list(tmp_peakTables, tmp_peakTables, tmp_peakTables)
  # dataPoints and peakFit for 3 samples and 0 cpds
  input_dataPoints          <- list(list(), list(), list())
  input_peakFit             <- list(list(), list(), list())
  expected_slotName         <- c("cpdID", "cpdName", "ROI", "FIR", "uROI", "filepath", "cpdMetadata", "spectraMetadata", "acquisitionTime", "uROIExist", "useUROI", "useFIR", "TIC", "peakTables", "dataPoints", "peakFit", "isAnnotated")
  expected_filepath         <- c('./path/file1', './path/file2', './path/file3')
  expected_acquisitionTime  <- as.character(c(NA, NA, NA))
  expected_ROI              <- data.frame(rtMin=numeric(), rt=numeric(), rtMax=numeric(), mzMin=numeric(), mz=numeric(), mzMax=numeric(), stringsAsFactors=F)
  expected_FIR              <- data.frame(rtMin=numeric(), rtMax=numeric(), mzMin=numeric(), mzMax=numeric(), stringsAsFactors=F)
  expected_uROI             <- data.frame(rtMin=numeric(), rt=numeric(), rtMax=numeric(), mzMin=numeric(), mz=numeric(), mzMax=numeric(), stringsAsFactors=F)
  expected_TIC              <- as.numeric(c(NA, NA, NA))
  expected_peakTables       <- vector('list', 3)
  expected_dataPoints       <- vector('list', 3)
  expected_peakFit          <- vector('list', 3)
  expected_cpdMetadata      <- data.frame(matrix(, nrow=0, ncol=0))
  expected_spectraMetadata  <- data.frame(matrix(, nrow=3, ncol=0))
  
  # Init object with spectraPaths
  spectraAnnotation <- peakPantheRAnnotation(spectraPaths=input_spectraPaths)
  # Check object values
  expect_true(class(spectraAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(spectraAnnotation), expected_slotName)
  expect_true(is.character(spectraAnnotation@cpdID))
  expect_equal(length(spectraAnnotation@cpdID), 0)
  expect_true(is.character(spectraAnnotation@cpdName))
  expect_equal(length(spectraAnnotation@cpdName), 0)
  expect_equal(spectraAnnotation@ROI, expected_ROI)
  expect_equal(spectraAnnotation@FIR, expected_FIR)
  expect_equal(spectraAnnotation@uROI, expected_uROI)
  expect_equal(spectraAnnotation@filepath, expected_filepath)
  expect_equal(spectraAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(spectraAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_equal(spectraAnnotation@acquisitionTime, expected_acquisitionTime)
  expect_false(spectraAnnotation@uROIExist)
  expect_false(spectraAnnotation@useUROI)
  expect_false(spectraAnnotation@useFIR)
  expect_equal(spectraAnnotation@TIC, expected_TIC)
  expect_equal(spectraAnnotation@peakTables, expected_peakTables)
  expect_equal(spectraAnnotation@dataPoints, expected_dataPoints)
  expect_equal(spectraAnnotation@peakFit, expected_peakFit)
  expect_false(spectraAnnotation@isAnnotated)

  # Provide a spectraMetadata that shouldn't get replaced
  specMetaAnnotation <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, spectraMetadata = input_spectraMetadata)
  # Check acquisitionTime get set from input and not default with spectraPaths
  expect_true(class(specMetaAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(specMetaAnnotation), expected_slotName)
  expect_true(is.character(specMetaAnnotation@cpdID))
  expect_equal(length(specMetaAnnotation@cpdID), 0)
  expect_true(is.character(specMetaAnnotation@cpdName))
  expect_equal(length(specMetaAnnotation@cpdName), 0)
  expect_equal(specMetaAnnotation@ROI, expected_ROI)
  expect_equal(specMetaAnnotation@FIR, expected_FIR)
  expect_equal(specMetaAnnotation@uROI, expected_uROI)
  expect_equal(specMetaAnnotation@filepath, expected_filepath)
  expect_equal(specMetaAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(specMetaAnnotation@spectraMetadata, input_spectraMetadata) # change is here
  expect_equal(specMetaAnnotation@acquisitionTime, expected_acquisitionTime)
  expect_false(specMetaAnnotation@uROIExist)
  expect_false(specMetaAnnotation@useUROI)
  expect_false(specMetaAnnotation@useFIR)
  expect_equal(specMetaAnnotation@TIC, expected_TIC)
  expect_equal(specMetaAnnotation@peakTables, expected_peakTables)
  expect_equal(specMetaAnnotation@dataPoints, expected_dataPoints)
  expect_equal(specMetaAnnotation@peakFit, expected_peakFit)
  expect_false(specMetaAnnotation@isAnnotated)
  
  # Provide a acquisitionTime that shouldn't get replaced
  acquAnnotation <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, acquisitionTime=input_acquisitionTime)
  # Check acquisitionTime get set from input and not default with spectraPaths
  expect_true(class(acquAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(acquAnnotation), expected_slotName)
  expect_true(is.character(acquAnnotation@cpdID))
  expect_equal(length(acquAnnotation@cpdID), 0)
  expect_true(is.character(acquAnnotation@cpdName))
  expect_equal(length(acquAnnotation@cpdName), 0)
  expect_equal(acquAnnotation@ROI, expected_ROI)
  expect_equal(acquAnnotation@FIR, expected_FIR)
  expect_equal(acquAnnotation@uROI, expected_uROI)
  expect_equal(acquAnnotation@filepath, expected_filepath)
  expect_equal(acquAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(acquAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_equal(acquAnnotation@acquisitionTime, input_acquisitionTime)  # change is here
  expect_false(acquAnnotation@uROIExist)
  expect_false(acquAnnotation@useUROI)
  expect_false(acquAnnotation@useFIR)
  expect_equal(acquAnnotation@TIC, expected_TIC)
  expect_equal(acquAnnotation@peakTables, expected_peakTables)
  expect_equal(acquAnnotation@dataPoints, expected_dataPoints)
  expect_equal(acquAnnotation@peakFit, expected_peakFit)
  expect_false(acquAnnotation@isAnnotated)

  # Provide a TIC that shouldn't get replaced
  TICAnnotation <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, TIC=input_TIC)
  # Check TIC get set from input and not default with spectraPaths
  expect_true(class(TICAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(TICAnnotation), expected_slotName)
  expect_true(is.character(TICAnnotation@cpdID))
  expect_equal(length(TICAnnotation@cpdID), 0)
  expect_true(is.character(TICAnnotation@cpdName))
  expect_equal(length(TICAnnotation@cpdName), 0)
  expect_equal(TICAnnotation@ROI, expected_ROI)
  expect_equal(TICAnnotation@FIR, expected_FIR)
  expect_equal(TICAnnotation@uROI, expected_uROI)
  expect_equal(TICAnnotation@filepath, expected_filepath)
  expect_equal(TICAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(TICAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_equal(TICAnnotation@acquisitionTime, expected_acquisitionTime)
  expect_false(TICAnnotation@uROIExist)
  expect_false(TICAnnotation@useUROI)
  expect_false(TICAnnotation@useFIR)
  expect_equal(TICAnnotation@TIC, input_TIC)                  # change is here
  expect_equal(TICAnnotation@peakTables, expected_peakTables)
  expect_equal(TICAnnotation@dataPoints, expected_dataPoints)
  expect_equal(TICAnnotation@peakFit, expected_peakFit)
  expect_false(TICAnnotation@isAnnotated)

  # Provide a peakTables that shouldn't get replaced
  peakTablesAnnotation <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, peakTables=input_peakTables)
  # Check peakTables get set from input and not default with spectraPaths
  expect_true(class(peakTablesAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(peakTablesAnnotation), expected_slotName)
  expect_true(is.character(peakTablesAnnotation@cpdID))
  expect_equal(length(peakTablesAnnotation@cpdID), 0)
  expect_true(is.character(peakTablesAnnotation@cpdName))
  expect_equal(length(peakTablesAnnotation@cpdName), 0)
  expect_equal(peakTablesAnnotation@ROI, expected_ROI)
  expect_equal(peakTablesAnnotation@FIR, expected_FIR)
  expect_equal(peakTablesAnnotation@uROI, expected_uROI)
  expect_equal(peakTablesAnnotation@filepath, expected_filepath)
  expect_equal(peakTablesAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(peakTablesAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_equal(peakTablesAnnotation@acquisitionTime, expected_acquisitionTime)
  expect_false(peakTablesAnnotation@uROIExist)
  expect_false(peakTablesAnnotation@useUROI)
  expect_false(peakTablesAnnotation@useFIR)
  expect_equal(peakTablesAnnotation@TIC, expected_TIC)
  expect_equal(peakTablesAnnotation@peakTables, input_peakTables) # change is here
  expect_equal(peakTablesAnnotation@dataPoints, expected_dataPoints)
  expect_equal(peakTablesAnnotation@peakFit, expected_peakFit)
  expect_false(peakTablesAnnotation@isAnnotated)

  # Provide a dataPoints that shouldn't get replaced
  dataPointsAnnotation <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, dataPoints=input_dataPoints)
  # Check dataPoints get set from input and not default with spectraPaths
  expect_true(class(dataPointsAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(dataPointsAnnotation), expected_slotName)
  expect_true(is.character(dataPointsAnnotation@cpdID))
  expect_equal(length(dataPointsAnnotation@cpdID), 0)
  expect_true(is.character(dataPointsAnnotation@cpdName))
  expect_equal(length(dataPointsAnnotation@cpdName), 0)
  expect_equal(dataPointsAnnotation@ROI, expected_ROI)
  expect_equal(dataPointsAnnotation@FIR, expected_FIR)
  expect_equal(dataPointsAnnotation@uROI, expected_uROI)
  expect_equal(dataPointsAnnotation@filepath, expected_filepath)
  expect_equal(dataPointsAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(dataPointsAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_equal(dataPointsAnnotation@acquisitionTime, expected_acquisitionTime)
  expect_false(dataPointsAnnotation@uROIExist)
  expect_false(dataPointsAnnotation@useUROI)
  expect_false(dataPointsAnnotation@useFIR)
  expect_equal(dataPointsAnnotation@TIC, expected_TIC)
  expect_equal(dataPointsAnnotation@peakTables, expected_peakTables)
  expect_equal(dataPointsAnnotation@dataPoints, input_dataPoints)   # change is here
  expect_equal(dataPointsAnnotation@peakFit, expected_peakFit)
  expect_false(dataPointsAnnotation@isAnnotated)

  # Provide a peakFit that shouldn't get replaced
  peakFitAnnotation <- peakPantheRAnnotation(spectraPaths=input_spectraPaths, peakFit=input_peakFit)
  # Check peakFit get set from input and not default with spectraPaths
  expect_true(class(peakFitAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(peakFitAnnotation), expected_slotName)
  expect_true(is.character(peakFitAnnotation@cpdID))
  expect_equal(length(peakFitAnnotation@cpdID), 0)
  expect_true(is.character(peakFitAnnotation@cpdName))
  expect_equal(length(peakFitAnnotation@cpdName), 0)
  expect_equal(peakFitAnnotation@ROI, expected_ROI)
  expect_equal(peakFitAnnotation@FIR, expected_FIR)
  expect_equal(peakFitAnnotation@uROI, expected_uROI)
  expect_equal(peakFitAnnotation@filepath, expected_filepath)
  expect_equal(peakFitAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(peakFitAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_equal(peakFitAnnotation@acquisitionTime, expected_acquisitionTime)
  expect_false(peakFitAnnotation@uROIExist)
  expect_false(peakFitAnnotation@useUROI)
  expect_false(peakFitAnnotation@useFIR)
  expect_equal(peakFitAnnotation@TIC, expected_TIC)
  expect_equal(peakFitAnnotation@peakTables, expected_peakTables)
  expect_equal(peakFitAnnotation@dataPoints, expected_dataPoints)
  expect_equal(peakFitAnnotation@peakFit, input_peakFit)     # change is here
  expect_false(peakFitAnnotation@isAnnotated)
  
  # Trigger checks on spectraPaths input
  # spectraPaths not a character vector
  expect_error(peakPantheRAnnotation(spectraPaths=c(1,2,3)), 'specified spectraPaths is not a vector of character')
  expect_error(peakPantheRAnnotation(spectraPaths=list()), 'specified spectraPaths is not a vector of character')
})

test_that('initialize with targetFeatTable', {
  # Input and expected values
  input_targetFeatTable             <- data.frame(matrix(vector(), 2, 8, dimnames=list(c(), c("cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
  input_targetFeatTable[1,]         <- c("ID-1", "Cpd 1", 3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
  input_targetFeatTable[2,]         <- c("ID-2", "Cpd 2", 3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
  input_targetFeatTable[,c(3:8)]  <- sapply(input_targetFeatTable[,c(3:8)], as.numeric)
  input_FIR         <- data.frame(rtMin=numeric(), rtMax=numeric(), mzMin=numeric(), mzMax=numeric(), stringsAsFactors=F)
  input_FIR[1,]     <- c(1., 2., 3., 4.)
  input_FIR[2,]     <- c(5., 6., 7., 8.)
  input_uROI        <- data.frame(rtMin=numeric(), rt=numeric(), rtMax=numeric(), mzMin=numeric(), mz=numeric(), mzMax=numeric(), stringsAsFactors=F)
  input_uROI[1,]    <- c(10., 11., 12., 13., 14., 15.)
  input_uROI[2,]    <- c(16., 17., 18., 19., 20., 21.)
  input_cpdMetadata <- data.frame(matrix(data=c('a','b'), nrow=2, ncol=1, dimnames=list(c(),c('testcol')), byrow=TRUE), stringsAsFactors=FALSE)
  expected_slotName         <- c("cpdID", "cpdName", "ROI", "FIR", "uROI", "filepath", "cpdMetadata", "spectraMetadata", "acquisitionTime", "uROIExist", "useUROI", "useFIR", "TIC", "peakTables", "dataPoints", "peakFit", "isAnnotated")
  expected_cpdID            <- c("ID-1", "ID-2")
  expected_cpdName          <- c('Cpd 1', 'Cpd 2')
  expected_ROI              <- data.frame(matrix(vector(), 2, 6, dimnames=list(c(), c("rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax"))), stringsAsFactors=F)
  expected_ROI[1,]          <- c(3310., 3344.888, 3390., 522.194778, 522.2, 522.205222)
  expected_ROI[2,]          <- c(3280., 3385.577, 3440., 496.195038, 496.2, 496.204962)
  expected_FIR              <- data.frame(rtMin=as.numeric(rep(NA,2)), rtMax=as.numeric(rep(NA,2)), mzMin=as.numeric(rep(NA,2)), mzMax=as.numeric(rep(NA,2)), stringsAsFactors=F)
  expected_uROI             <- data.frame(rtMin=as.numeric(rep(NA,2)), rt=as.numeric(rep(NA,2)), rtMax=as.numeric(rep(NA,2)), mzMin=as.numeric(rep(NA,2)), mz=as.numeric(rep(NA,2)), mzMax=as.numeric(rep(NA,2)), stringsAsFactors=F)
  expected_cpdMetadata      <- data.frame(matrix(, nrow=2, ncol=0))
  expected_spectraMetadata  <- data.frame(matrix(, nrow=0, ncol=0))


  # Init object with targetFeatTable
  targetFeatTableAnnotation <- peakPantheRAnnotation(targetFeatTable=input_targetFeatTable)
  # Check object values
  expect_true(class(targetFeatTableAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(targetFeatTableAnnotation), expected_slotName)
  expect_equal(targetFeatTableAnnotation@cpdID, expected_cpdID)
  expect_equal(targetFeatTableAnnotation@cpdName, expected_cpdName)
  expect_equal(targetFeatTableAnnotation@ROI, expected_ROI)
  expect_equal(targetFeatTableAnnotation@FIR, expected_FIR)
  expect_equal(targetFeatTableAnnotation@uROI, expected_uROI)
  expect_true(is.character(targetFeatTableAnnotation@filepath))
  expect_equal(length(targetFeatTableAnnotation@filepath), 0)
  expect_true(is.character(targetFeatTableAnnotation@acquisitionTime))
  expect_equal(targetFeatTableAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(targetFeatTableAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_equal(length(targetFeatTableAnnotation@acquisitionTime), 0)
  expect_false(targetFeatTableAnnotation@uROIExist)
  expect_false(targetFeatTableAnnotation@useUROI)
  expect_false(targetFeatTableAnnotation@useFIR)
  expect_true(is.numeric(targetFeatTableAnnotation@TIC))
  expect_equal(length(targetFeatTableAnnotation@TIC), 0)
  expect_true(is.list(targetFeatTableAnnotation@peakTables))
  expect_equal(length(targetFeatTableAnnotation@peakTables), 0)
  expect_true(is.list(targetFeatTableAnnotation@dataPoints))
  expect_equal(length(targetFeatTableAnnotation@dataPoints), 0)
  expect_true(is.list(targetFeatTableAnnotation@peakFit))
  expect_equal(length(targetFeatTableAnnotation@peakFit), 0)
  expect_false(targetFeatTableAnnotation@isAnnotated)

  # Provide a cpdMetadata that shouldn't get replaced
  cpdMetadataAnnotation <- peakPantheRAnnotation(targetFeatTable=input_targetFeatTable, cpdMetadata=input_cpdMetadata)
  # check object
  expect_true(class(cpdMetadataAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(cpdMetadataAnnotation), expected_slotName)
  expect_equal(cpdMetadataAnnotation@cpdID, expected_cpdID)
  expect_equal(cpdMetadataAnnotation@cpdName, expected_cpdName)
  expect_equal(cpdMetadataAnnotation@ROI, expected_ROI)
  expect_equal(cpdMetadataAnnotation@FIR, expected_FIR)
  expect_equal(cpdMetadataAnnotation@uROI, expected_uROI)
  expect_true(is.character(cpdMetadataAnnotation@filepath))
  expect_equal(length(cpdMetadataAnnotation@filepath), 0)
  expect_equal(cpdMetadataAnnotation@cpdMetadata, input_cpdMetadata) # change is here
  expect_equal(cpdMetadataAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_true(is.character(cpdMetadataAnnotation@acquisitionTime))
  expect_equal(length(cpdMetadataAnnotation@acquisitionTime), 0)
  expect_false(cpdMetadataAnnotation@uROIExist)
  expect_false(cpdMetadataAnnotation@useUROI)
  expect_false(cpdMetadataAnnotation@useFIR)
  expect_true(is.numeric(cpdMetadataAnnotation@TIC))
  expect_equal(length(cpdMetadataAnnotation@TIC), 0)
  expect_true(is.list(cpdMetadataAnnotation@peakTables))
  expect_equal(length(cpdMetadataAnnotation@peakTables), 0)
  expect_true(is.list(cpdMetadataAnnotation@dataPoints))
  expect_equal(length(cpdMetadataAnnotation@dataPoints), 0)
  expect_true(is.list(cpdMetadataAnnotation@peakFit))
  expect_equal(length(cpdMetadataAnnotation@peakFit), 0)
  expect_false(cpdMetadataAnnotation@isAnnotated)
  
  # Provide a FIR that shouldn't get replaced, and set useFIR
  FIRAnnotation <- peakPantheRAnnotation(targetFeatTable=input_targetFeatTable, FIR=input_FIR, useFIR=TRUE)
  # check object
  expect_true(class(FIRAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(FIRAnnotation), expected_slotName)
  expect_equal(FIRAnnotation@cpdID, expected_cpdID)
  expect_equal(FIRAnnotation@cpdName, expected_cpdName)
  expect_equal(FIRAnnotation@ROI, expected_ROI)
  expect_equal(FIRAnnotation@FIR, input_FIR) # change is here
  expect_equal(FIRAnnotation@uROI, expected_uROI)
  expect_true(is.character(FIRAnnotation@filepath))
  expect_equal(length(FIRAnnotation@filepath), 0)
  expect_equal(FIRAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(FIRAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_true(is.character(FIRAnnotation@acquisitionTime))
  expect_equal(length(FIRAnnotation@acquisitionTime), 0)
  expect_false(FIRAnnotation@uROIExist)
  expect_false(FIRAnnotation@useUROI)
  expect_true(FIRAnnotation@useFIR) # change is here
  expect_true(is.numeric(FIRAnnotation@TIC))
  expect_equal(length(FIRAnnotation@TIC), 0)
  expect_true(is.list(FIRAnnotation@peakTables))
  expect_equal(length(FIRAnnotation@peakTables), 0)
  expect_true(is.list(FIRAnnotation@dataPoints))
  expect_equal(length(FIRAnnotation@dataPoints), 0)
  expect_true(is.list(FIRAnnotation@peakFit))
  expect_equal(length(FIRAnnotation@peakFit), 0)
  expect_false(FIRAnnotation@isAnnotated)

  # Provide a uROI that shouldn't get replaced, and set uROIExist
  uROIAnnotation <- peakPantheRAnnotation(targetFeatTable=input_targetFeatTable, uROI=input_uROI, uROIExist=TRUE)
  # check object
  expect_true(class(uROIAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(uROIAnnotation), expected_slotName)
  expect_equal(uROIAnnotation@cpdID, expected_cpdID)
  expect_equal(uROIAnnotation@cpdName, expected_cpdName)
  expect_equal(uROIAnnotation@ROI, expected_ROI)
  expect_equal(uROIAnnotation@FIR, expected_FIR)
  expect_equal(uROIAnnotation@uROI, input_uROI) # change is here
  expect_true(is.character(uROIAnnotation@filepath))
  expect_equal(length(uROIAnnotation@filepath), 0)
  expect_equal(uROIAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(uROIAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_true(is.character(uROIAnnotation@acquisitionTime))
  expect_equal(length(uROIAnnotation@acquisitionTime), 0)
  expect_true(uROIAnnotation@uROIExist) # change is here
  expect_false(uROIAnnotation@useUROI)
  expect_false(uROIAnnotation@useFIR)
  expect_true(is.numeric(uROIAnnotation@TIC))
  expect_equal(length(uROIAnnotation@TIC), 0)
  expect_true(is.list(uROIAnnotation@peakTables))
  expect_equal(length(uROIAnnotation@peakTables), 0)
  expect_true(is.list(uROIAnnotation@dataPoints))
  expect_equal(length(uROIAnnotation@dataPoints), 0)
  expect_true(is.list(uROIAnnotation@peakFit))
  expect_equal(length(uROIAnnotation@peakFit), 0)
  expect_false(uROIAnnotation@isAnnotated)

  # Force uROIExist and useUROI to FALSE (despite setting to TRUE) as uROI is reset
  uROIResetAnnotation <- peakPantheRAnnotation(targetFeatTable=input_targetFeatTable, uROIExist=TRUE, useUROI=TRUE)
  # check object
  expect_true(class(uROIResetAnnotation) == "peakPantheRAnnotation")
  expect_equal(slotNames(uROIResetAnnotation), expected_slotName)
  expect_equal(uROIResetAnnotation@cpdID, expected_cpdID)
  expect_equal(uROIResetAnnotation@cpdName, expected_cpdName)
  expect_equal(uROIResetAnnotation@ROI, expected_ROI)
  expect_equal(uROIResetAnnotation@FIR, expected_FIR)
  expect_equal(uROIResetAnnotation@uROI, expected_uROI)
  expect_true(is.character(uROIResetAnnotation@filepath))
  expect_equal(length(uROIResetAnnotation@filepath), 0)
  expect_equal(uROIResetAnnotation@cpdMetadata, expected_cpdMetadata)
  expect_equal(uROIResetAnnotation@spectraMetadata, expected_spectraMetadata)
  expect_true(is.character(uROIResetAnnotation@acquisitionTime))
  expect_equal(length(uROIResetAnnotation@acquisitionTime), 0)
  expect_false(uROIResetAnnotation@uROIExist) # false as ROI is reset
  expect_false(uROIResetAnnotation@useUROI) # false as ROI is reset
  expect_false(uROIResetAnnotation@useFIR)
  expect_true(is.numeric(uROIResetAnnotation@TIC))
  expect_equal(length(uROIResetAnnotation@TIC), 0)
  expect_true(is.list(uROIResetAnnotation@peakTables))
  expect_equal(length(uROIResetAnnotation@peakTables), 0)
  expect_true(is.list(uROIResetAnnotation@dataPoints))
  expect_equal(length(uROIResetAnnotation@dataPoints), 0)
  expect_true(is.list(uROIResetAnnotation@peakFit))
  expect_equal(length(uROIResetAnnotation@peakFit), 0)
  expect_false(uROIResetAnnotation@isAnnotated)


  # Trigger checks on targetFeatTable input
  # targetFeatTable is not a data.frame
  expect_error(peakPantheRAnnotation(targetFeatTable='notADataFrame'), 'specified targetFeatTable is not a data.frame')
  # targetFeatTable has wrong columns
  wrongDF1           <- input_targetFeatTable
  colnames(wrongDF1) <- c("not cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz", "mzMax")
  expect_error(peakPantheRAnnotation(targetFeatTable=wrongDF1), 'expected columns in targetFeatTable are "cpdID", "cpdName", "rtMin", "rt", "rtMax", "mzMin", "mz" and "mzMax"')
  # targetFeatTable$cpdID not numeric
  wrongDF2        <- input_targetFeatTable
  wrongDF2$cpdID  <- c(5, 5)
  expect_error(peakPantheRAnnotation(targetFeatTable=wrongDF2), 'cpdID must be character')
  # targetFeatTable$cpdID not character
  wrongDF3          <- input_targetFeatTable
  wrongDF3$cpdName  <- c(5, 5)
  expect_error(peakPantheRAnnotation(targetFeatTable=wrongDF3), 'cpdName must be character')
  # targetFeatTable$rtMin not numeric
  wrongDF4        <- input_targetFeatTable
  wrongDF4$rtMin  <- c('notNumeric', 'notNumeric')
  expect_error(peakPantheRAnnotation(targetFeatTable=wrongDF4), 'rtMin must be numeric')
  # targetFeatTable$rt not numeric or NA
  wrongDF5        <- input_targetFeatTable
  wrongDF5$rt     <- c('notNumeric', 'notNumeric')
  expect_error(peakPantheRAnnotation(targetFeatTable=wrongDF5), 'rt must be numeric or NA')
  # targetFeatTable$rtMax not numeric
  wrongDF6        <- input_targetFeatTable
  wrongDF6$rtMax  <- c('notNumeric', 'notNumeric')
  expect_error(peakPantheRAnnotation(targetFeatTable=wrongDF6), 'rtMax must be numeric')
  # targetFeatTable$mzMin not numeric
  wrongDF7        <- input_targetFeatTable
  wrongDF7$mzMin  <- c('notNumeric', 'notNumeric')
  expect_error(peakPantheRAnnotation(targetFeatTable=wrongDF7), 'mzMin must be numeric')
  # targetFeatTable$mz not numeric or NA
  wrongDF8        <- input_targetFeatTable
  wrongDF8$mz     <- c('notNumeric', 'notNumeric')
  expect_error(peakPantheRAnnotation(targetFeatTable=wrongDF8), 'mz must be numeric or NA')
  # targetFeatTable$mzMax not numeric
  wrongDF9        <- input_targetFeatTable
  wrongDF9$mzMax  <- c('notNumeric', 'notNumeric')
  expect_error(peakPantheRAnnotation(targetFeatTable=wrongDF9), 'mzMax must be numeric')
})
