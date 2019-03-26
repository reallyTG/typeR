library(oro.dicom)


### Name: orthogonal-planes
### Title: Orthogonal Planes
### Aliases: is.axial is.coronal is.sagittal orthogonal-planes
### Keywords: misc

### ** Examples

x <- readDICOMFile(system.file("dcm/Abdo.dcm", package="oro.dicom"))
iop <- header2matrix(extractHeader(x$hdr, "ImageOrientationPatient", FALSE), 6)
is.axial(iop)
is.coronal(iop)
is.sagittal(iop)

x <- readDICOMFile(system.file("dcm/Spine1.dcm", package="oro.dicom"))
iop <- header2matrix(extractHeader(x$hdr, "ImageOrientationPatient", FALSE), 6)
is.axial(iop)
is.coronal(iop)
is.sagittal(iop)



