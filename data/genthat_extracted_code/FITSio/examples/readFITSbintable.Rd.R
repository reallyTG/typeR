library(FITSio)


### Name: readFITSbintable
### Title: Read a FITS binary table
### Aliases: readFITSbintable
### Keywords: file

### ** Examples

require(FITSio)

## Either download example file from
## <http://fits.gsfc.nasa.gov/fits_samples.html>
## and use
## Not run: filename <- "IUElwp25637mxlo.fits"
## or, for local example use
filename <- system.file("fitsExamples", "IUElwp25637mxlo.fits",
                        package = "FITSio")

## Open file, read header and table, close file.
zz <- file(description = filename, open = "rb")
header0 <- readFITSheader(zz) # read primary header
header <- readFITSheader(zz) # read extension header
D <- readFITSbintable(zz, header)
close(zz)

## Look at contents
str(D)
str(header)
str(parseHdr(header))
D$hdr[which(D$hdr=="BITPIX")+1]   # BITPIX value from header
D$colNames
plot(D$col[[5]], ylab = "Value", main = D$colNames[5], type = "l")




