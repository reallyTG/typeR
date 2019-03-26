library(MSnbase)


### Name: Spectra
### Title: List of Spectrum objects along with annotations
### Aliases: Spectra Spectra-class show,Spectra-method
###   coerce,Spectra,list-method coerce,Spectra,MSnExp-method
###   mz,Spectra-method intensity,Spectra-method rtime,Spectra-method
###   precursorMz,Spectra-method precursorCharge,Spectra-method
###   precScanNum,Spectra-method precursorIntensity,Spectra-method
###   acquisitionNum,Spectra-method scanIndex,Spectra-method
###   peaksCount,Spectra,ANY-method msLevel,Spectra-method
###   tic,Spectra-method ionCount,Spectra-method
###   collisionEnergy,Spectra-method fromFile,Spectra-method
###   polarity,Spectra-method smoothed,Spectra-method
###   isEmpty,Spectra-method centroided,Spectra-method
###   isCentroided,Spectra-method writeMgfData,Spectra-method
###   clean,Spectra-method removePeaks,Spectra-method
###   filterMz,Spectra-method pickPeaks,Spectra-method
###   smooth,Spectra-method filterMsLevel,Spectra-method

### ** Examples


## Create from Spectrum objects
sp1 <- new("Spectrum1", mz = c(1, 2, 4), intensity = c(4, 5, 2))
sp2 <- new("Spectrum2", mz = c(1, 2, 3, 4), intensity = c(5, 3, 2, 5),
    precursorMz = 2)

spl <- Spectra(sp1, sp2)
spl
spl[[1]]

## Add also metadata columns
mcols(spl)$id <- c("a", "b")
mcols(spl)

## Create a Spectra with metadata
spl <- Spectra(sp1, sp2, elementMetadata = DataFrame(id = c("a", "b")))

mcols(spl)
mcols(spl)$id

## Extract the mz values for the individual spectra
mz(spl)

## Extract the intensity values for the individual spectra
intensity(spl)

## Extract the retention time values for the individual spectra
rtime(spl)

## Extract the precursor m/z of each spectrum.
precursorMz(spl)

## Extract the precursor charge of each spectrum.
precursorCharge(spl)

## Extract the precursor scan number for each spectrum.
precScanNum(spl)

## Extract the precursor intensity of each spectrum.
precursorIntensity(spl)

## Extract the acquisition number of each spectrum.
acquisitionNum(spl)

## Extract the scan index of each spectrum.
scanIndex(spl)

## Get the number of peaks per spectrum.
peaksCount(spl)

## Get the MS level of each spectrum.
msLevel(spl)

## Get the total ion current for each spectrum.
tic(spl)

## Get the total ion current for each spectrum.
ionCount(spl)

## Extract the collision energy for each spectrum.
collisionEnergy(spl)

## Extract the file index for each spectrum.
fromFile(spl)

## Get the polarity for each spectrum.
polarity(spl)

## Whether spectra are smoothed (i.e. processed with the `smooth`
## function).
smoothed(spl)

## Are spectra empty (i.e. contain no peak data)?
isEmpty(spl)

## Do the spectra contain centroided data?
centroided(spl)

## Do the spectra contain centroided data? Whether spectra are centroided
## is estimated from the peak data.
isCentroided(spl)

## Export the spectrum list to a MGF file. Values in metadata columns are
## exported as additional field for each spectrum.
tmpf <- tempfile()
writeMgfData(spl, tmpf)

## Evaluate the written output. The ID of each spectrum (defined in the
## "id" metadata column) is exported as field "ID".
readLines(tmpf)

## Set mcols to NULL to avoid export of additional data fields.
mcols(spl) <- NULL
file.remove(tmpf)

writeMgfData(spl, tmpf)
readLines(tmpf)

## Filter the object by MS level
filterMsLevel(spl, msLevel. = 1)



