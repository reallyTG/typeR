library(MSnbase)


### Name: extractPrecSpectra-methods
### Title: Extracts precursor-specific spectra from an 'MSnExp' object
### Aliases: extractPrecSpectra-methods extractPrecSpectra
### Keywords: methods

### ** Examples

file <- dir(system.file(package="MSnbase",dir="extdata"),
            full.name=TRUE,pattern="mzXML$")
aa <- readMSData(file,verbose=FALSE)
my.prec <- precursorMz(aa)[1]
my.prec
bb <- extractPrecSpectra(aa,my.prec)
precursorMz(bb)
processingData(bb)



