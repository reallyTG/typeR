library(FIACH)


### Name: viewR
### Title: Interactive Medical Image Viewer
### Aliases: viewR

### ** Examples

 ## Not run: 
##D url <- "http://nifti.nimh.nih.gov/nifti-1/data/filtered_func_data.nii.gz"
##D urlfile <- tempfile(pattern="filtered_func_data", fileext=".nii.gz")
##D download.file(url, urlfile, quiet=TRUE)
##D data<-readNii(urlfile)
##D viewR(data)
##D ## Try coordinate  47,25,10
## End(Not run)



