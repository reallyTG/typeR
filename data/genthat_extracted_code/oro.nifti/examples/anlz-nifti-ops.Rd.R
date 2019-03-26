library(oro.nifti)


### Name: anlz-nifti-ops
### Title: Operations for Objects in the ANALYZE and NIfTI classes
### Aliases: anlz-nifti-ops Ops,anlz,anlz-method Ops,anlz,numeric-method
###   Ops,numeric,anlz-method Ops,nifti,anlz-method Ops,anlz,nifti-method

### ** Examples


img01 <- anlz(array(1:64, c(4,4,4,1)), datatype=4)
img02 <- anlz(array(64:1, c(4,4,4,1)), datatype=4)
is.anlz(img01 + img02)
is.anlz(sqrt(2) * img01)
is.anlz(img02 / pi)




