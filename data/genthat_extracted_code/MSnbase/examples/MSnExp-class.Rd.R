library(MSnbase)


### Name: MSnExp-class
### Title: The 'MSnExp' Class for MS Data And Meta-Data
### Aliases: MSnExp-class class:MSnExp MSnExp bin,MSnExp-method
###   clean,MSnExp-method compareSpectra,MSnExp,missing-method
###   extractPrecSpectra,MSnExp-method
###   extractPrecSpectra,MSnExp,numeric-method pickPeaks,MSnExp-method
###   estimateNoise,MSnExp-method plot,MSnExp plot,MSnExp,missing-method
###   quantify,MSnExp-method quantify,OnMSnExp-method
###   quantify,MSnExp,character-method removePeaks,MSnExp-method
###   removeReporters,MSnExp-method removeReporters,OnDiskMSnExp-method
###   smooth,MSnExp-method addIdentificationData,MSnExp,character-method
###   addIdentificationData,MSnExp,mzRident-method
###   addIdentificationData,MSnExp,mzIDClasses-method
###   addIdentificationData,MSnExp,mzID-method
###   addIdentificationData,MSnExp,mzIDCollection-method
###   addIdentificationData,MSnExp,data.frame-method
###   removeNoId,MSnExp-method removeMultipleAssignment,MSnExp-method
###   idSummary,MSnExp-method show,MSnExp-method spectra,MSnExp-method
###   trimMz,MSnExp-method trimMz,MSnExp,numeric-method
###   isolationWindow,MSnExp-method filterMsLevel
###   filterMsLevel,MSnExp-method filterMsLevel,OnDiskMSnExp-method
###   filterMz,MSnExp-method filterMz,OnDiskMSnExp-method filterRt
###   filterRt,MSnExp-method filterRt,OnDiskMSnExp-method filterFile
###   filterFile,MSnExp-method filterFile,OnDiskMSnExp-method
###   filterAcquisitionNum filterAcquisitionNum,MSnExp-method
###   filterAcquisitionNum,OnDiskMSnExp-method filterEmptySpectra
###   filterEmptySpectra,MSnExp-method
###   filterEmptySpectra,OnDiskMSnExp-method filterPrecursorScan
###   filterPrecursorScan,MSnExp-method
###   filterPrecursorScan,OnDiskMSnExp-method isCentroided,MSnExp-method
###   all.equal,MSnExp,MSnExp-method all.equal,MSnExp,OnDiskMSnExp-method
###   all.equal,OnDiskMSnExp,MSnExp-method
###   all.equal,OnDiskMSnExp,OnDiskMSnExp-method splitByFile
###   splitByFile,MSnExp,factor-method coerce,MSnExp,data.frame-method
###   as.data.frame.MSnExp coerce,MSnExp,Spectra-method
### Keywords: classes

### ** Examples

mzxmlfile <- dir(system.file("extdata",package="MSnbase"),
		 pattern="mzXML",full.names=TRUE)
msnexp <- readMSData(mzxmlfile)
msnexp



