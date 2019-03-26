library(oro.nifti)


### Name: readNIfTI
### Title: readNIfTI
### Aliases: readNIfTI nifti_header
### Keywords: file

### ** Examples


## Not run: 
##D url <- "http://nifti.nimh.nih.gov/nifti-1/data/filtered_func_data.nii.gz"
##D urlfile <- file.path(system.file("nifti", package="oro.nifti"),
##D                      "filtered_func_data")
##D download.file(url, urlfile, quiet=TRUE)
## End(Not run)
## The NIfTI file provided here contains the first 18 volumes (10%)
## of the original data set
urlfile <- file.path(system.file("nifti", package="oro.nifti"),
                     "filtered_func_data")
(ffd <- readNIfTI(urlfile))
image(ffd, oma=rep(2,4))
orthographic(ffd, oma=rep(2,4))
## Not run: 
##D ## 27 scans of Colin Holmes (MNI) brain co-registered and averaged
##D ## NIfTI two-file format
##D URL <- "http://imaging.mrc-cbu.cam.ac.uk/downloads/Colin/colin_1mm.tgz"
##D urlfile <- file.path(tempdir(), "colin_1mm.tgz")
##D download.file(URL, dest=urlfile, quiet=TRUE)
##D untar(urlfile, exdir=tempdir())
##D colin <- readNIfTI(file.path(tempdir(), "colin_1mm"))
##D image(colin, oma=rep(2,4))
##D orthographic(colin, oma=rep(2,4))
## End(Not run)



