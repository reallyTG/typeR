library(oro.nifti)


### Name: cal_min-methods
### Title: Extract Image Attribute 'cal_min'
### Aliases: cal_min-methods cal_min-methods, cal_min cal_min,nifti-method
###   cal_min,anlz-method cal_min<- cal_min<-,nifti-method
###   cal_min<-,anlz-method cal.min cal.min,nifti-method
###   cal.min,anlz-method cal.min<- cal.min<-,nifti-method
###   cal.min<-,anlz-method

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
cal.min(mniLR)



