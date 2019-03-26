library(oro.nifti)


### Name: descrip-methods
### Title: Extract Image Attribute 'descrip'
### Aliases: descrip-methods descrip-methods, descrip descrip,nifti-method
###   descrip,anlz-method descrip<- descrip<-,nifti-method
###   descrip<-,anlz-method

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
descrip(mniLR)
## Not run: 
##D descrip(mniLR) <- paste(descrip(mniLR), version$version.string, sep="; ")
##D descrip(mniLR)
## End(Not run)



