library(spam)


### Name: import
### Title: Read External Matrix Formats
### Aliases: import read.MM read.HB
### Keywords: IO array algebra

### ** Examples


## Not run: 
##D image(read.MM(gzcon(url(
##D   "ftp://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/bcspwr/bcspwr01.mtx.gz"))))
## End(Not run)

## Not run: 
##D ## Datasets supplied within Matrix
##D str(read.MM(system.file("external/pores_1.mtx",package = "Matrix")))
##D str(read.HB(system.file("external/utm300.rua", package = "Matrix")))
##D str(read.MM(system.file("external/lund_a.mtx", package = "Matrix")))
##D str(read.HB(system.file("external/lund_a.rsa", package = "Matrix")))
## End(Not run)



