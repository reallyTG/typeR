library(MSnbase)


### Name: combineSpectraMovingWindow
### Title: Combine signal from consecutive spectra of LCMS experiments
### Aliases: combineSpectraMovingWindow

### ** Examples


library(MSnbase)
library(msdata)

## Read a profile-mode LC-MS data file.
fl <- dir(system.file("sciex", package = "msdata"), full.names = TRUE)[1]
od <- readMSData(fl, mode = "onDisk")

## Subset the object to the retention time range that includes the signal
## for proline. This is done for performance reasons.
rtr <- c(165, 175)
od <- filterRt(od, rtr)

## Combine signal from neighboring spectra.
od_comb <- combineSpectraMovingWindow(od)

## The combined spectra have the same number of spectra, same number of
## mass peaks per spectra, but the signal is larger in the combined object.
length(od)
length(od_comb)

peaksCount(od)
peaksCount(od_comb)

## Comparing the chromatographic signal for proline (m/z ~ 116.0706)
## before and after spectra data combination.
mzr <- c(116.065, 116.075)
chr <- chromatogram(od, rt = rtr, mz = mzr)
chr_comb <- chromatogram(od_comb, rt = rtr, mz = mzr)

par(mfrow = c(1, 2))
plot(chr)
plot(chr_comb)
## Chromatographic data is "smoother" after combining.



