library(fpc)


### Name: jittervar
### Title: Jitter variables in a data matrix
### Aliases: jittervar
### Keywords: manip

### ** Examples

  set.seed(776655)
  v1 <- rnorm(20)
  v2 <- rnorm(20)
  d1 <- sample(1:5,20,replace=TRUE)
  d2 <- sample(1:4,20,replace=TRUE)
  ldata <- cbind(v1,v2,d1,d2)
  jv <- jittervar(ldata,jitterv=3:4)



