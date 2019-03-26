library(fslr)


### Name: fsl_smooth
### Title: Gaussian smooth image using FSL
### Aliases: fsl_smooth fslsmooth

### ** Examples

if (have.fsl()){
system.time({
dims = c(50, 50, 20)
x = array(rnorm(prod(dims)), dim = dims)
img = nifti(x, dim= dims, 
datatype = convert.datatype()$FLOAT32, cal.min = min(x), 
cal.max = max(x), pixdim = rep(1, 4))
s.img = fslsmooth(img, retimg=TRUE)
})
}



