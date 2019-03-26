library(fslr)


### Name: fsl_erode
### Title: Erode image using FSL
### Aliases: fsl_erode fslerode

### ** Examples

if (have.fsl()){
system.time({
dims = c(50, 50, 20)
x = array(rnorm(prod(dims)), dim = dims) 
img = nifti(x, dim= dims, 
datatype = convert.datatype()$FLOAT32, cal.min = min(x), 
cal.max = max(x), pixdim = rep(1, 4))
mask = img > .5
eroded = fslerode(mask, kopts = "-kernel boxv 5", retimg=TRUE)
})
}    



