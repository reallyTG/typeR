library(oro.nifti)


### Name: nifti-operators
### Title: Operations for NIfTI Objects
### Aliases: nifti-operators Ops,nifti,nifti-method
###   Ops,nifti,numeric-method Ops,numeric,nifti-method

### ** Examples


img01 <- nifti(array(1:64, c(4,4,4,1)), datatype=4)
img02 <- nifti(array(64:1, c(4,4,4,1)), datatype=4)
is.nifti(img01 + img02)
is.nifti(sqrt(2) * img01)
is.nifti(img02 / pi)




