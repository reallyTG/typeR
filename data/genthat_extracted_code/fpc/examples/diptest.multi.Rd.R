library(fpc)


### Name: diptest.multi
### Title: Diptest for discriminant coordinate projection
### Aliases: diptest.multi
### Keywords: cluster multivariate

### ** Examples

  require(diptest)
  x <- cbind(runif(100),runif(100))
  partition <- 1+(x[,1]<0.5)
  d1 <- diptest.multi(x,partition)
  d2 <- diptest.multi(x,partition,pvalue="tantrum",M=10)



