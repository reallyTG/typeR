library(neurobase)


### Name: cog
### Title: Image Center of Gravity
### Aliases: cog

### ** Examples

dims = rep(20, 3)
x = array(rnorm(prod(dims)), dim = dims)
img = nifti(x, dim= dims, 
datatype = convert.datatype()$FLOAT32, cal.min = min(x), 
cal.max = max(x), pixdim = rep(1, 4))
cog(img)



