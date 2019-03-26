library(MSnbase)


### Name: estimateMzResolution,MSnExp-method
### Title: Estimate the m/z resolution of a spectrum
### Aliases: estimateMzResolution,MSnExp-method
###   estimateMzResolution,Spectrum-method estimateMzResolution

### ** Examples


## Load a profile mode example file
library(MSnbase)
library(msdata)
f <- proteomics(full.names = TRUE,
    pattern = "TMT_Erwinia_1uLSike_Top10HCD_isol2_45stepped_60min_01.mzML.gz")

od <- readMSData(f, mode = "onDisk")

## Estimate the m/z resolution on the 3rd spectrum.
estimateMzResolution(od[[3]])

## Estimate the m/z resolution for each spectrum
mzr <- estimateMzResolution(od)

## plot the distribution of estimated m/z resolutions. The bimodal
## distribution represents the m/z resolution of the MS1 (first peak) and
## MS2 spectra (second peak).
plot(density(unlist(mzr)))



