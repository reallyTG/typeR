library(xROI)


### Name: extractCCC
### Title: Extract chromatic coefficients and their statistics
### Aliases: extractCCC
### Keywords: bcc chromatic coordinates exract gcc rcc

### ** Examples


m <- tiff::readTIFF(system.file(package = 'xROI', 'dukehw-mask.tif'))
jpgFile <- system.file(package = 'xROI', 'dukehw.jpg')
cc <- extractCCC(jpgFile, m)



