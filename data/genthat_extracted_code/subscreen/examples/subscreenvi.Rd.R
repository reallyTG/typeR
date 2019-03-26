library(subscreen)


### Name: subscreenvi
### Title: (iii) Determine variable importance
### Aliases: subscreenvi
### Keywords: importance variable

### ** Examples

## Not run: 
##D require(survival)
##D data(pbc)
##D pbc$status <- ifelse(pbc$status==0,0,1)
##D importance <- subscreenvi(data=pbc, y='time', cens='status', trt='trt', x=NULL)
## End(Not run)



