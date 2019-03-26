library(oro.dicom)


### Name: create3D
### Title: Create Arrays from DICOM Headers/Images
### Aliases: create3D create4D

### ** Examples

load(system.file("hk-40/hk40.RData", package="oro.dicom"))
dcmList <- hk40
dcmImage <- create3D(dcmList)
image(dcmImage[,,1], col=grey(0:64/64), axes=FALSE, xlab="", ylab="",
      main=paste("First Slice from HK-40"))
imagePositionPatient <- attributes(dcmImage)$ipp
dSL <- abs(diff(imagePositionPatient[,3]))
plot(dSL, ylim=range(range(dSL) * 1.5, 0, 10), xlab="Image", ylab="mm",
     main="Difference in Slice Location")

## Not run: 
##D ## pixelData = FALSE
##D ## The DICOM image data are read from create3D()
##D ## This may save on memory for large batches of DICOM data
##D dcmList <- readDICOM(system.file("hk-40", package="oro.dicom"),
##D                      pixelData=FALSE)
##D dcmImage <- create3D(dcmList, pixelData=FALSE)
##D image(dcmImage[,,1], col=grey(0:64/64), axes=FALSE, xlab="", ylab="",
##D       main=paste("First Slice from HK-40 (again)"))
## End(Not run)
## mosaic = TRUE
mosaicFile <- system.file("dcm/MR-sonata-3D-as-Tile.dcm", package="oro.dicom")
dcm <- readDICOMFile(mosaicFile)
image(t(dcm$img), col=grey(0:64/64), axes=FALSE, xlab="", ylab="",
      main="Siemens MOSAIC")
dcmImage <- create3D(dcm, mode="integer", mosaic=TRUE)
z <- trunc(dim(dcmImage)[3]/2)
image(dcmImage[,,z], col=grey(0:64/64), axes=FALSE, xlab="", ylab="",
      main=paste("Slice", z, "from Siemens MOSAIC"))



