library(Rnightlights)


### Name: pkgReset
### Title: Reset global options for the Rnightlights package
### Aliases: pkgReset

### ** Examples

#get cropMaskMethod
pkgOptions("cropMaskMethod") #returns default "rast"

#set cropMaskMethod to "gdal"
pkgOptions(cropMaskMethod="gdal") #sets to "gdal"

#check cropMaskMethod has changed
pkgOptions("cropMaskMethod") #returns "gdal"

#reset pkgOptions
pkgReset()

#check cropMaskMethod has been reset
pkgOptions("cropMaskMethod") #returns default "rast"




