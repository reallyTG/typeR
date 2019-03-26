library(fslr)


### Name: fsl_fill
### Title: Fill image holes
### Aliases: fsl_fill fslfill

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
filled = fslfill(eroded, retimg= TRUE)
})
}  



