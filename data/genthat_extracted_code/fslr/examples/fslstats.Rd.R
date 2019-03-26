library(fslr)


### Name: fslstats
### Title: FSL Stats
### Aliases: fslstats

### ** Examples

if (have.fsl()){
system.time({
x = array(rnorm(1e6), dim = c(100, 100, 100))
img = nifti(x, dim= c(100, 100, 100), 
datatype = convert.datatype()$FLOAT32, cal.min = min(x), 
cal.max = max(x), pixdim = rep(1, 4))
entropy = fslstats(img, opts='-E')
})
}  



