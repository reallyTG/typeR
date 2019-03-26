library(oro.nifti)


### Name: readAFNI
### Title: readAFNI
### Aliases: readAFNI
### Keywords: file methods

### ** Examples

## Not run: 
##D ## Taken from the AFNI Matlab Library
##D ## http://afni.nimh.nih.gov/pub/dist/data/afni_matlab_data.tgz
##D afni.path <- system.file("afni", package="oro.nifti")
##D orig <- readAFNI(file.path(afni.path, "ARzs_CW_avvr.DEL+orig"))
##D image(orig, zlim=c(0.5,256), oma=rep(2,4))
##D orthographic(orig, zlim=c(0.5,256), oma=rep(2,4))
##D ## Taken from the AFNI installation
##D TT <- readAFNI(file.path(afni.path, "TT_N27_EZ_LR+tlrc"))
##D image(TT, zlim=c(0.5,256), oma=rep(2,4))
##D orthographic(TT, zlim=c(0.5,256), oma=rep(2,4))
## End(Not run)



