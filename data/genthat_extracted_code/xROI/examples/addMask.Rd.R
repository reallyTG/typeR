library(xROI)


### Name: addMask
### Title: Plot or add a mask
### Aliases: addMask
### Keywords: mask plot raster

### ** Examples


#read a mask file in TIFF format
m <- tiff::readTIFF(system.file(package = 'xROI', 'dukehw-mask.tif'))
str(m)

#plot the mask in black color
addMask(m, add = FALSE)

#add the same mask in the red color to the existing plot
addMask(m, add = TRUE, col = 'red')




