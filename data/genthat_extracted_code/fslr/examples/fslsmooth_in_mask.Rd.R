library(fslr)


### Name: fslsmooth_in_mask
### Title: Smooth Image Within a Mask Only
### Aliases: fslsmooth_in_mask fsl_smooth_in_mask

### ** Examples

if (have.fsl()){
system.time({
dims = c(50, 50, 20)
x = array(rnorm(prod(dims)), dim = dims)
img = nifti(x, dim= dims, 
datatype = convert.datatype()$FLOAT32, cal.min = min(x), 
cal.max = max(x), pixdim = rep(1, 4))
mask = abs(img ) > 1
s.img = fslsmooth_in_mask(img, mask = mask)
})
}



