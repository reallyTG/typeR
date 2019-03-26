library(FITSio)


### Name: readFrameFromFITS
### Title: Read a single data set from a FITS file into a data frame
### Aliases: readFrameFromFITS
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

## Get data and display
F <- readFrameFromFITS(filename) 
names(F)
plot(F$NET, ylab = "Value", main = names(F)[5], type = "l")

### Simple flat file example
filename <- system.file("fitsExamples", "2008_03_11_203150.fits",
                        package = "FITSio")  
F <- readFrameFromFITS(filename) 
names(F)
attach(F)
plot(DMJD, TiltX, xlab = "Time [DMJD]", ylab = "X Tilt [degr]", type = "l")
detach(F)




