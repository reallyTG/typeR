library(FITSio)


### Name: readFITSheader
### Title: Read a FITS header
### Aliases: readFITSheader
### Keywords: file

### ** Examples

require(FITSio)
## Make test image with axis information, write to disk
Z <- matrix(1:15, ncol = 3)
writeFITSim(Z, file = "test.fits", c1 = "Test FITS file",
            crpix = c(1,1), crvaln = c(10, 100), cdeltn = c(8, 2),
            ctypen = c("Distance", "Time"),
            cunitn = c("Furlongs", "Fortnights"))
## Read back in
## Open file, read header and array, close file and delete.
    zz <- file(description = "test.fits", open = "rb")
    header <- readFITSheader(zz)
    hdr <- parseHdr(header)
    D <- readFITSarray(zz, hdr)
    close(zz)
    hdr[1:10]                       # Header sample
    hdr[which(hdr=="BITPIX")+1]   # BITPIX value from header
    unlink("test.fits")



