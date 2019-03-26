library(oro.nifti)


### Name: orientation-methods
### Title: Extract NIfTI 3D Image Orientation
### Aliases: orientation-methods qform-methods qform,nifti-method qform
###   sform-methods sform,nifti-method sform
### Keywords: methods

### ** Examples


## Not run: 
##D url <- "http://nifti.nimh.nih.gov/nifti-1/data/avg152T1_LR_nifti.nii.gz"
##D urlfile <- file.path(system.file("nifti", package="oro.nifti"),
##D                      "mniLR.nii.gz")
##D download.file(url, urlfile, quiet=TRUE)
## End(Not run)
urlfile <- file.path(system.file("nifti", package="oro.nifti"),
                     "mniLR.nii.gz")
mniLR <- readNIfTI(urlfile)
sform(mniLR)



