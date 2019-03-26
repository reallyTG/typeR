library(FIACH)


### Name: kmeansMask
### Title: Binarize vector, matrix or array
### Aliases: kmeansMask

### ** Examples

file<-system.file("extdata","motion_ex.nii.gz",package="FIACH")
arr<-readNii(file)[,,,1]
mask<-kmeansMask(arr)




