library(fslr)


### Name: fsl_sub2
### Title: Subsample image by factor of 2
### Aliases: fsl_sub2 fslsub2

### ** Examples

if (have.fsl()){
system.time({
x = array(rnorm(1e6), dim = c(100, 100, 100))
img = nifti(x, dim= c(100, 100, 100), 
datatype = convert.datatype()$FLOAT32, cal.min = min(x), 
cal.max = max(x), pixdim = rep(1, 4))
subsamp = fslsub2(img, retimg=TRUE)
print(voxdim(subsamp))
})
} 



