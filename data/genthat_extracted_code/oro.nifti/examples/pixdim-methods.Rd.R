library(oro.nifti)


### Name: pixdim-methods
### Title: Extract Image Attribute 'pixdim'
### Aliases: pixdim-methods pixdim-methods, pixdim pixdim,nifti-method
###   pixdim,anlz-method pixdim<- pixdim<-,nifti-method
###   pixdim<-,anlz-method

### ** Examples

## Not run: 
##D url <- "http://nifti.nimh.nih.gov/nifti-1/data/avg152T1_LR_nifti.nii.gz"
##D urlfile <- file.path(system.file("nifti", package="oro.nifti"),
##D "mniLR.nii.gz")
##D download.file(url, urlfile, quiet=TRUE)
## End(Not run)
urlfile <- file.path(system.file("nifti", package="oro.nifti"),
                     "mniLR.nii.gz")
mniLR <- readNIfTI(urlfile)
pixdim(mniLR)



