library(neurobase)


### Name: copyNIfTIHeader
### Title: Copy NIfTI Header to an array
### Aliases: copyNIfTIHeader

### ** Examples

img = nifti(img = array(rnorm(10^4), dim=rep(10, 4)), dim=rep(10, 4), datatype = 16)
sub = img[,,,1:3]
copyNIfTIHeader(img, sub)
sub = img[,,,1, drop=FALSE]
copyNIfTIHeader(img, sub) 
copyNIfTIHeader(img, sub, drop = FALSE) 



