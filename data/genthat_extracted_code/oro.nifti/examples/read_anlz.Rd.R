library(oro.nifti)


### Name: readANALYZE
### Title: readANALYZE
### Aliases: readANALYZE
### Keywords: file

### ** Examples


## avg152T1
anlz.path <- system.file("anlz", package="oro.nifti")
mni152 <- readANALYZE(file.path(anlz.path, "avg152T1"))
image(mni152, oma=rep(2,4))
orthographic(mni152, oma=rep(2,4))



