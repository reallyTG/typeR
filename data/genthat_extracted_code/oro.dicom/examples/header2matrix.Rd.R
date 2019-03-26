library(oro.dicom)


### Name: header2matrix
### Title: Converts DICOM Header Field to a Matrix
### Aliases: header2matrix
### Keywords: misc

### ** Examples

x <- readDICOMFile(system.file("dcm/Abdo.dcm", package="oro.dicom"))
pixelSpacing <- extractHeader(x$hdr, "PixelSpacing", numeric=FALSE)
pSmat <- header2matrix(pixelSpacing, ncol=2)
IOP <- extractHeader(x$hdr, "ImageOrientationPatient", numeric=FALSE)
IOPmat <- header2matrix(IOP, ncol=6)



