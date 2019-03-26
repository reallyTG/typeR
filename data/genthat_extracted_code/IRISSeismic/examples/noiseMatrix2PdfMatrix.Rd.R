library(IRISSeismic)


### Name: noiseMatrix2PdfMatrix
### Title: Convert matrix of PSDs to matrix of Probability Density
###   Functions
### Aliases: noiseMatrix2PdfMatrix
### Keywords: spectra

### ** Examples

## Not run: 
##D # Create a new IrisClient
##D iris <- new("IrisClient", debug=TRUE)
##D 
##D # Get seismic data
##D starttime <- as.POSIXct("2011-05-05", tz="GMT") # 2011.125
##D endtime <- starttime + 1*24*3600
##D st <- getDataselect(iris,"IU","GRFO","--","BHE",starttime,endtime)
##D 
##D # Generate power spectral density for each hour long segment
##D psdList <- psdList(st)
##D 
##D # Convert into corrected "noiseMatrix"
##D noiseMatrix <- psdList2NoiseMatrix(psdList)
##D 
##D # Convert into McNamara "pdfMatrix"
##D pdfMatrix <- noiseMatrix2PdfMatrix(noiseMatrix)
##D 
##D # NOTE:  Data need to be flipped and tranposed for the XY axes in the
##D # NOTE:  image() function to match rows and columns in our pdfMatrix
##D # Plot pdfMatrix
##D image(t(pdfMatrix[,ncol(pdfMatrix):1]),
##D       col=c('gray90',rainbow(9)),
##D       axes=FALSE)
## End(Not run)



