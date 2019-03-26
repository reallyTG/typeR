library(oro.nifti)


### Name: cal_max-methods
### Title: Extract Image Attribute 'cal_max'
### Aliases: cal_max-methods cal_max-methods, cal_max cal_max,nifti-method
###   cal_max,anlz-method cal_max<- cal_max<-,nifti-method
###   cal_max<-,anlz-method cal.max cal.max,nifti-method
###   cal.max,anlz-method cal.max<- cal.max<-,nifti-method
###   cal.max<-,anlz-method

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
cal.max(mniLR)



