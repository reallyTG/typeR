library(colorSpec)


### Name: readSpectra
### Title: read colorSpec objects from files
### Aliases: readSpectra readAllSpectra readSpectraXYY
###   readSpectraSpreadsheet readSpectrumScope readSpectraControl
###   readSpectraCGATS
### Keywords: colorSpec

### ** Examples

#   read file with header declaring the quantity to be "photons->neural"
bird = readSpectra( system.file( "extdata/eyes/BirdEyes.txt", package='colorSpec' ) )
quantity(bird)   # [1] "photons->neural"



