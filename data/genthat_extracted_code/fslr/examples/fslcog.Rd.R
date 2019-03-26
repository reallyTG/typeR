library(fslr)


### Name: fslcog
### Title: Image Center of Gravity (FSL)
### Aliases: fslcog

### ** Examples

if (have.fsl()){
x = array(rnorm(1e6), dim = c(100, 100, 100))
img = nifti(x, dim= c(100, 100, 100), 
datatype = convert.datatype()$FLOAT32, cal.min = min(x), 
cal.max = max(x), pixdim = rep(1, 4))
fslcog(img)
}



