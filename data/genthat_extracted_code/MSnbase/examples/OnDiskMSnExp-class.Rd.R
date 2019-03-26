library(MSnbase)


### Name: OnDiskMSnExp-class
### Title: The 'OnDiskMSnExp' Class for MS Data And Meta-Data
### Aliases: OnDiskMSnExp-class class:OnDiskMSnExp OnDiskMSnExp
###   show,OnDiskMSnExp-method [,OnDiskMSnExp,ANY,ANY,ANY-method
###   [,OnDiskMSnExp,logicalOrNumeric,missing,missing-method
###   [[,OnDiskMSnExp-method [[,OnDiskMSnExp,ANY,ANY-method
###   [[,OnDiskMSnExp,ANY,ANY,missing-method
###   [[,OnDiskMSnExp,ANY,missing,missing-method
###   acquisitionNum,OnDiskMSnExp-method assayData,OnDiskMSnExp-method
###   isCentroided,OnDiskMSnExp-method centroided,OnDiskMSnExp-method
###   centroided<-,OnDiskMSnExp,logical-method smoothed,OnDiskMSnExp-method
###   smoothed<-,OnDiskMSnExp,logical-method fromFile,OnDiskMSnExp-method
###   header,OnDiskMSnExp,missing-method header,OnDiskMSnExp,numeric-method
###   ionCount,OnDiskMSnExp-method intensity,OnDiskMSnExp-method
###   length,OnDiskMSnExp-method msLevel,OnDiskMSnExp-method
###   mz,OnDiskMSnExp-method peaksCount,OnDiskMSnExp,missing-method
###   peaksCount,OnDiskMSnExp,numeric-method polarity,OnDiskMSnExp-method
###   rtime,OnDiskMSnExp-method scanIndex,OnDiskMSnExp-method
###   spectra,OnDiskMSnExp-method tic,OnDiskMSnExp-method
###   bpi,OnDiskMSnExp-method bpi precScanNum,OnDiskMSnExp-method
###   featureNames<-,OnDiskMSnExp-method
###   featureNames<-,OnDiskMSnExp,ANY-method
###   featureNames,OnDiskMSnExp-method precScanNum,OnDiskMSnExp-method
###   precursorIntensity,OnDiskMSnExp-method
###   collisionEnergy,OnDiskMSnExp-method
###   compareSpectra,OnDiskMSnExp,missing-method
###   estimateNoise,OnDiskMSnExp-method
###   extractPrecSpectra,OnDiskMSnExp,numeric-method
###   pickPeaks,OnDiskMSnExp-method precursorCharge,OnDiskMSnExp-method
###   precursorMz,OnDiskMSnExp-method quantify,OnDiskMSnExp-method
###   smooth,OnDiskMSnExp-method spectrapply,OnDiskMSnExp-method
###   clean,OnDiskMSnExp-method removePeaks,OnDiskMSnExp-method
###   bin,OnDiskMSnExp-method trimMz,OnDiskMSnExp,numeric-method
###   normalize,OnDiskMSnExp-method normalise,OnDiskMSnExp-method
###   validateOnDiskMSnExp coerce,OnDiskMSnExp,MSnExp-method
###   as.MSnExp.OnDiskMSnExp
### Keywords: classes

### ** Examples

## Get some example mzML files
library(msdata)
mzfiles <- c(system.file("microtofq/MM14.mzML", package="msdata"),
	     system.file("microtofq/MM8.mzML", package="msdata"))
## Read the data as an OnDiskMSnExp
odmse <- readMSData(mzfiles, msLevel=1, centroided = TRUE)

## Get the length of data, i.e. the total number of spectra.
length(odmse)

## Get the MS level
head(msLevel(odmse))

## Get the featureData, use fData to return as a data.frame
head(fData(odmse))

## Get to know from which file the spectra are
head(fromFile(odmse))

## And the file names:
fileNames(odmse)

## Scan index and acquisitionNum
head(scanIndex(odmse))
head(acquisitionNum(odmse))

## Extract the spectra; the data is retrieved from the raw files.
head(spectra(odmse))

## Extracting individual spectra or a subset is much faster.
spectra(odmse[1:50])

## Alternatively, we could also subset the whole object by spectra and/or samples:
subs <- odmse[rtime(odmse) >= 2 & rtime(odmse) <= 20, ]
fileNames(subs)
rtime(subs)

## Extract intensities and M/Z values per spectrum; the methods return a list,
## each element representing the values for one spectrum.
ints <- intensity(odmse)
mzs <- mz(odmse)

## Return a data.frame with mz and intensity pairs for each spectrum from the
## object
res <- spectrapply(odmse, FUN = as, Class = "data.frame")

## Calling removePeaks, i.e. setting intensity values below a certain threshold to 0.
## Unlike the name suggests, this is not actually removing peaks. Such peaks with a 0
## intensity are then removed by the "clean" step.
## Also, the manipulations are not applied directly, but put into the "lazy"
## processing queue.
odmse <- removePeaks(odmse, t=10000)
odmse <- clean(odmse)

## The processing steps are only applied when actual raw data is extracted.
spectra(odmse[1:2])

## Get the polarity of the spectra.
head(polarity(odmse))

## Get the retention time of all spectra
head(rtime(odmse))

## Get the intensities after removePeaks and clean
intsAfter <- intensity(odmse)

head(lengths(ints))
head(lengths(intsAfter))

## The same for the M/Z values
mzsAfter <- intensity(odmse)
head(lengths(mzs))
head(lengths(mzsAfter))


## Centroided or profile mode
f <- msdata::proteomics(full.names = TRUE,
			pattern = "MS3TMT11.mzML")
odmse <- readMSData(f, mode = "onDisk")
validObject(odmse)
odmse[[1]]

table(isCentroidedFromFile(odmse), msLevel(odmse))

## centroided status could be set manually
centroided(odmse, msLevel = 1) <- FALSE
centroided(odmse, msLevel = 2) <- TRUE
centroided(odmse, msLevel = 3) <- TRUE

## or when reading the data
odmse2 <- readMSData(f, centroided = c(FALSE, TRUE, TRUE),
		     mode = "onDisk")
table(centroided(odmse), msLevel(odmse))

## Filtering precursor scans

head(acquisitionNum(odmse))
head(msLevel(odmse))

## Extract all spectra stemming from the first MS1 spectrum
(from1 <- filterPrecursorScan(odmse, 21945))
table(msLevel(from1))


## Extract the second sepctrum's parent (MS1) and children (MS3)
## spectra
(from2 <- filterPrecursorScan(odmse, 21946))
table(msLevel(from2))




