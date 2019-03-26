library(FITSio)


### Name: readFITStable
### Title: Read a FITS ASCII table
### Aliases: readFITStable
### Keywords: file

### ** Examples

require(FITSio)

filename <- system.file("fitsExamples", "vizier.fits",
                        package = "FITSio")

## Simple read
D <- readFITS(filename)

## Explicit read: open file, read header and table, close file.
zz <- file(description = filename, open = "rb")
header0 <- readFITSheader(zz) # read primary header
header <- readFITSheader(zz) # read extension header
D <- readFITStable(zz, header)
close(zz)

## Either way, look at contents
str(D)
str(D$DF)
str(header)
str(parseHdr(header))
D$hdr[which(D$hdr=="BITPIX")+1]   # BITPIX value from header
D$colNames




