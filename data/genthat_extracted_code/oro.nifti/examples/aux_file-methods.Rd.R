library(oro.nifti)


### Name: aux_file-methods
### Title: Extract Image Attribute 'aux_file'
### Aliases: aux_file-methods aux_file-methods, aux_file
###   aux_file,nifti-method aux_file,anlz-method aux_file<-
###   aux_file<-,nifti-method aux_file<-,anlz-method aux.file
###   aux.file,nifti-method aux.file,anlz-method aux.file<-
###   aux.file<-,nifti-method aux.file<-,anlz-method

### ** Examples

## Not run: 
##D url <- "http://nifti.nimh.nih.gov/nifti-1/data/avg152T1_RL_nifti.nii.gz"
##D urlfile <- file.path(system.file("nifti", package="oro.nifti"),
##D                     "mniRL.nii.gz")
##D download.file(url, urlfile, quiet=TRUE)
## End(Not run)
options("niftiAuditTrail"=FALSE)

urlfile <- file.path(system.file("nifti", package="oro.nifti"),
                     "mniRL.nii.gz")
mniRL <- readNIfTI(urlfile)
aux.file(mniRL)
aux.file(mniRL) <- "avg152T1_RL_nifti"
aux.file(mniRL)



