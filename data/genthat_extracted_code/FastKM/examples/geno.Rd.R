library(FastKM)


### Name: geno
### Title: Create a geno Object.
### Aliases: geno

### ** Examples

  gdata <- matrix(sample(0:1,40,replace=TRUE,prob=c(0.9,0.1)),ncol=4L)

  geno(mat = gdata, kernel = "ibs", 
       weights = NULL, inheritMode="add")




