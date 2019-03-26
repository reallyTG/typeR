library(oro.dicom)


### Name: dicom2nifti
### Title: Convert DICOM Header to NIfTI
### Aliases: dicom2nifti
### Keywords: file

### ** Examples

## Not run: 
##D dcmList <- dicomSeparate(system.file("hk-40", package="oro.dicom"))
##D require("oro.nifti")
##D dcmNifti <- dicom2nifti(dcmList, datatype=4, mode="integer")
##D qform(dcmNifti)
##D sform(dcmNifti)
##D image(dcmNifti)
##D orthographic(dcmNifti)
## End(Not run)



