library(doParallel)


### Name: registerDoParallel
### Title: registerDoParallel
### Aliases: registerDoParallel stopImplicitCluster
### Keywords: utilities

### ** Examples

cl <- makePSOCKcluster(2)
registerDoParallel(cl)
m <- matrix(rnorm(9), 3, 3)
foreach(i=1:nrow(m), .combine=rbind) 
stopCluster(cl)



