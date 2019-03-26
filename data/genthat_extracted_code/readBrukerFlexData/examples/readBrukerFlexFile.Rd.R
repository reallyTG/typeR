library(readBrukerFlexData)


### Name: readBrukerFlexFile
### Title: Reads mass spectrometry data in Bruker Daltonics XMASS format.
### Aliases: readBrukerFlexFile
### Keywords: IO

### ** Examples

## load library
library("readBrukerFlexData")

## get examples directory
exampleDirectory <- system.file("Examples", package="readBrukerFlexData")

## read example spectrum
spec <- readBrukerFlexFile(file.path(exampleDirectory,
  "2010_05_19_Gibb_C8_A1/0_A1/1/1SLin/fid"))

## print metaData
print(spec$metaData)

## plot spectrum
plot(spec$spectrum$mass, spec$spectrum$intensity, type="l", col="red")




