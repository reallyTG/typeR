library(neurobase)


### Name: mask_vals
### Title: Extract or Replace Values Inside a Mask
### Aliases: mask_vals mask_vals-methods, mask_vals<-
###   mask_vals<-,nifti-method mask_vals<-,nifti,ANY,ANY-method
###   mask_vals<-,anlz-method mask_vals<-,anlz,ANY,ANY-method
###   mask_vals<-,array-method mask_vals<-,array,ANY,ANY-method

### ** Examples

img = nifti(array(rnorm(10^3), dim = rep(10, 3)))
mask = img > 1.5
mask_vals(img, mask)
mask_vals(img, mask) = rep(4, sum(mask))
mask_vals(img, as(mask, "array")) = rep(4, sum(mask))
mask_vals(as(img, "array"), 
    as(mask, "array")) = rep(4, sum(mask))



