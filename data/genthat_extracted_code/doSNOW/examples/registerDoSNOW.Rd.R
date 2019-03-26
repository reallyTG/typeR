library(doSNOW)


### Name: registerDoSNOW
### Title: registerDoSNOW
### Aliases: registerDoSNOW
### Keywords: utilities

### ** Examples
## No test: 
cl <- makeCluster(2, type="SOCK")
registerDoSNOW(cl)
m <- matrix(rnorm(9), 3, 3)
foreach(i=1:nrow(m), .combine=rbind) %dopar%  (m[i,] / mean(m[i,]))
stopCluster(cl)
## End(No test)


