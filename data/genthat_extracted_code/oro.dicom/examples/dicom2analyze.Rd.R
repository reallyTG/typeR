library(oro.dicom)


### Name: dicom2analyze
### Title: Convert DICOM Header to Analyze
### Aliases: dicom2analyze
### Keywords: file

### ** Examples

## Not run: 
##D dcmList <- dicomSeparate(system.file("hk-40", package="oro.dicom"))
##D require("oro.nifti")
##D dcmAnlz <- dicom2analyze(dcmList, datatype=4, mode="integer")
##D image(dcmAnlz)
##D orthographic(dcmAnlz)
## End(Not run)



