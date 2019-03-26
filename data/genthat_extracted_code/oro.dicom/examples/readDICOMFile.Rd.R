library(oro.dicom)


### Name: readDICOMFile
### Title: Read Single DICOM File
### Aliases: parseDICOMHeader readDICOMFile
### Keywords: file

### ** Examples

x <- readDICOMFile(system.file("dcm/Abdo.dcm", package="oro.dicom"))
graphics::image(t(x$img), col=grey(0:64/64), axes=FALSE, xlab="", ylab="",
                main="Abdo.dcm")

x <- readDICOMFile(system.file("dcm/Spine1.dcm", package="oro.dicom"))
graphics::image(t(x$img), col=grey(0:64/64), axes=FALSE, xlab="", ylab="",
                main="Spine1.dcm")



