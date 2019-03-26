library(MSnbase)


### Name: readSRMData
### Title: Read SRM/MRM chromatographic data
### Aliases: readSRMData

### ** Examples


## Read an example MRM/SRM data
library(msdata)
fl <- proteomics(full.names = TRUE, pattern = "MRM")

## Read the data
mrm <- readSRMData(fl)

## The data is represented as a Chromatograms object, each column
## containing the data from one input file
mrm

## Access the polarity for each chromatogram (row)
polarity(mrm)

## Access the precursor m/z. The result is returned as a matrix with
## columns representing the minimum and maximum m/z (will be identical in
## most cases).
precursorMz(mrm)

## Access the product m/z.
productMz(mrm)

## Plot one chromatogram
plot(mrm[1, ])



