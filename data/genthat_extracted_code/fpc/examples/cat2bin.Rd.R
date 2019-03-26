library(fpc)


### Name: cat2bin
### Title: Recode nominal variables to binary variables
### Aliases: cat2bin
### Keywords: manip

### ** Examples

  set.seed(776655)
  v1 <- rnorm(20)
  v2 <- rnorm(20)
  d1 <- sample(1:5,20,replace=TRUE)
  d2 <- sample(1:4,20,replace=TRUE)
  ldata <- cbind(v1,v2,d1,d2)
  lc <- cat2bin(ldata,categorical=3:4)



