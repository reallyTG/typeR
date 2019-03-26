library(RiemBase)


### Name: riemfactory
### Title: Prepare a S3 Class Object 'riemdata'
### Aliases: riemfactory

### ** Examples

## No test: 
# Test with Sphere S^2 in R^3 example
## Prepare a matrix and list of 20 samples on S^2
sp.mat  = array(0,c(3,20)) # each vector will be recorded as a column
sp.list = list()
for (i in 1:20){
  tgt = rnorm(3)               # sample random numbers
  tgt = tgt/sqrt(sum(tgt*tgt)) # normalize
  
  sp.mat[,i]   = tgt   # record it as column vector
  sp.list[[i]] = tgt   # record it as an element in a list
}

## wrap it using 'riemfactory'
rsp1 = riemfactory(sp.mat, name="Sphere")
rsp2 = riemfactory(sp.list, name="spHeRe")
## End(No test)




