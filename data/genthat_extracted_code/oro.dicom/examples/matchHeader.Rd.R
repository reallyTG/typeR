library(oro.dicom)


### Name: matchHeader
### Title: Match String to DICOM Header Field
### Aliases: matchHeader

### ** Examples

x <- readDICOMFile(system.file("dcm/Abdo.dcm", package="oro.dicom"))
modality <- extractHeader(x$hdr, "Modality", numeric=FALSE)
matchHeader(modality, "mr") # case insensitive by default



