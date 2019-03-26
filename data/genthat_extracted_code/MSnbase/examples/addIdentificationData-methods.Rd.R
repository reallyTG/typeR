library(MSnbase)


### Name: addIdentificationData-methods
### Title: Adds Identification Data
### Aliases: addIdentificationData-methods addIdentificationData
### Keywords: methods

### ** Examples

## find path to a mzXML file
quantFile <- dir(system.file(package = "MSnbase", dir = "extdata"),
                 full.name = TRUE, pattern = "mzXML$")
## find path to a mzIdentML file
identFile <- dir(system.file(package = "MSnbase", dir = "extdata"),
                 full.name = TRUE, pattern = "dummyiTRAQ.mzid")

## create basic MSnExp
msexp <- readMSData(quantFile)

## add identification information
msexp <- addIdentificationData(msexp, identFile)

## access featureData
fData(msexp)

idSummary(msexp)



