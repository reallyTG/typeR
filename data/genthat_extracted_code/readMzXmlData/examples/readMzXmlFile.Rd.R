library(readMzXmlData)


### Name: readMzXmlFile
### Title: Reads mass spectrometry data in mzXML format.
### Aliases: readMzXmlFile
### Keywords: IO

### ** Examples

## load library
library("readMzXmlData")

## get examples directory
exampleDirectory <- system.file("Examples", package="readMzXmlData")

## read example spectrum
spec <- readMzXmlFile(file.path(exampleDirectory, "A1-0_A1.mzXML"))

## print metaData
print(spec$metaData)

## plot spectrum
plot(spec$spectrum$mass, spec$spectrum$intensity, type="l")



