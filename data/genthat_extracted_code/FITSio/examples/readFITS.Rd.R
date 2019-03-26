library(FITSio)


### Name: readFITS
### Title: Read a single data set from a FITS file
### Aliases: readFITS
### Keywords: file

### ** Examples

require(FITSio)

### Image example
## Make test image with axis information, write to disk
Z <- matrix(1:15, ncol = 3)
writeFITSim(Z, file = "test.fits", c1 = "Test FITS file",
            crpix = c(1,1), crvaln = c(10, 100), cdeltn = c(8, 2),
            ctypen = c("Distance", "Time"),
            cunitn = c("Furlongs", "Fortnights"))
## Read back in and display
X <-  readFITS("test.fits")
ax1 <- axVec(1, X$axDat)          # Make axis vector for image
ax2 <- axVec(2, X$axDat)
xlab <- X$axDat$ctype[1]
ylab <- paste(X$axDat$ctype[2], " [", X$axDat$cunit[2], "]", sep = "")
image(ax1, ax2, X$imDat, xlab = xlab, ylab = ylab)
str(X)
X$axDat                           # Display data frame with axis data
X$hdr[1:10]                       # Header sample
X$hdr[which(X$hdr=="BITPIX")+1]   # BITPIX value from header
unlink("test.fits")
## No axis scale markings
image(X$imDat, xlab = xlab, ylab = ylab, xaxt = "n", yaxt = "n")

### Binary table examples
## Bintable with one row and differently multi-dimensional columns
## Either download example file from
## <http://fits.gsfc.nasa.gov/fits_samples.html>
## and use
## Not run: filename <- "IUElwp25637mxlo.fits"
## or, for local example use
filename <- system.file("fitsExamples", "IUElwp25637mxlo.fits",
                        package = "FITSio")

Y <- readFITS(filename)
## Look at contents
str(Y)
Y$colNames
str(Y$col)
Y$hdr[which(Y$hdr=="BITPIX")+1]   # BITPIX value from header
plot(Y$col[[5]], ylab = "Value", main = Y$colNames[5], type = "l")

### Simple flat file example
filename <- system.file("fitsExamples", "2008_03_11_203150.fits",
                        package = "FITSio")
Z <- readFITS(filename)
str(Z)
Z$colNames
str(Z$col)
attach(Z)
xc <- which(colNames == "DMJD")
yc <- which(colNames == "TiltX")
xlab <- paste(colNames[xc], " [", colUnits[xc], "]", sep = "")
ylab <- paste(colNames[yc], " [", colUnits[yc], "]", sep = "")
plot(col[[xc]], col[[yc]], xlab = xlab, ylab = ylab, type = "l")
detach(Z)




