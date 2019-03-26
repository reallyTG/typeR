library(FITSio)


### Name: readFITSarray
### Title: Read an image (multi-dimensional array) from a FITS file
### Aliases: readFITSarray
### Keywords: file

### ** Examples

    require(FITSio)
    ## Make a test file.
    Z <- matrix(1:15, ncol = 3)
    writeFITSim(Z, "test.fits")
    ## Open file, read header and array, close file and delete.
    zz <- file(description = "test.fits", open = "rb")
    header <- readFITSheader(zz)  # image data off primary header
    D <- readFITSarray(zz, header)
    close(zz)
    ## Look at data list, header file, and parsed header
    str(D)
    image(D$imDat)
    str(header)
    str(parseHdr(header))
    ## Delete test file
    unlink("test.fits")



