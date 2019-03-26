library(oro.dicom)


### Name: extractHeader
### Title: Extract Single Field from DICOM Headers
### Aliases: extractHeader
### Keywords: misc

### ** Examples

x <- readDICOMFile(system.file("dcm/Abdo.dcm", package="oro.dicom"))
seriesDescription <- extractHeader(x$hdr, "SeriesDescription", numeric=FALSE)
IOP <- extractHeader(x$hdr, "ImageOrientationPatient", numeric=FALSE)



