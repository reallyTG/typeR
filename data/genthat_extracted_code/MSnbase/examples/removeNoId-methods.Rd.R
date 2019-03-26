library(MSnbase)


### Name: removeNoId-methods
### Title: Removes non-identified features
### Aliases: removeNoId-methods removeNoId
### Keywords: methods

### ** Examples

  quantFile <- dir(system.file(package = "MSnbase", dir = "extdata"),
                     full.name = TRUE, pattern = "mzXML$")
  identFile <- dir(system.file(package = "MSnbase", dir = "extdata"),
                     full.name = TRUE, pattern = "dummyiTRAQ.mzid")
  msexp <- readMSData(quantFile)
  msexp <- addIdentificationData(msexp, identFile)
  fData(msexp)$sequence
  length(msexp)

  ## using default fcol
  msexp2 <- removeNoId(msexp)
  length(msexp2)
  fData(msexp2)$sequence

  ## using keep
  print(fvarLabels(msexp))
  (k <- fData(msexp)$'MS.GF.EValue' > 75)
  k[is.na(k)] <- FALSE
  k
  msexp3 <- removeNoId(msexp, keep = k)
  length(msexp3)
  fData(msexp3)$sequence



