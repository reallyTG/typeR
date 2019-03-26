library(oro.nifti)


### Name: dropImageDimension
### Title: Drop Image Dimension
### Aliases: dropImageDimension drop_img_dim

### ** Examples


nim <- nifti(array(rnorm(10^3), dim = rep(10, 3)))
nim2 <- nifti(array(rnorm(10^3), dim = c(10, 10, 1, 10)))
dropImageDimension(nim2)
dropImageDimension(nim2, onlylast = FALSE)
nim3 <- nifti(array(rnorm(10^3), dim = c(10, 10, 10, 1)))
dropImageDimension(nim3)
dropImageDimension(nim3, onlylast = FALSE) # the same as above
nim4 <- nifti(array(rnorm(10^3), dim = c(10, 10, 10, 1, 10)))
dim(nim4[,,,1,])
dim(nim4[,,,1,,drop=TRUE])
dropImageDimension(nim4)

nim5 <- nifti(array(rnorm(10^4), dim = c(1, 10, 10, 10, 1, 10)))
dropImageDimension(nim5)
dropImageDimension(nim5, onlylast = FALSE)

nim6 <- nifti(array(rnorm(10^3), dim = c(1, 10, 10, 10, 1, 1)))
dropImageDimension(nim6)
## Not run: 
##D ## 27 scans of Colin Holmes (MNI) brain co-registered and averaged
##D ## NIfTI two-file format
##D URL <- "http://imaging.mrc-cbu.cam.ac.uk/downloads/Colin/colin_1mm.tgz"
##D urlfile <- file.path(tempdir(), "colin_1mm.tgz")
##D download.file(URL, dest=urlfile, quiet=TRUE)
##D untar(urlfile, exdir=tempdir())
##D colin <- readNIfTI(file.path(tempdir(), "colin_1mm"))
##D dim(colin)
##D dim_(colin)
##D pixdim(colin)
##D # this will error
##D writeNIfTI(colin, filename = tempfile())
##D colin <- dropImageDimension(colin)
##D writeNIfTI(colin, filename = tempfile())
## End(Not run)



