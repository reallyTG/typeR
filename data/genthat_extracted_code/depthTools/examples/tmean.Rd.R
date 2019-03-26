library(depthTools)


### Name: tmean
### Title: Modified Band Depth-Based Alpha Trimmed Mean
### Aliases: tmean
### Keywords: multivariate

### ** Examples

  set.seed(50)
  x <- matrix(rnorm(100),10,10)
  m.x<-apply(x,2,mean)
  t.x<-tmean(x,plotting=TRUE, lty=1)

  t.x.seq <- tmean(x,alpha=c(0,0.25,0.5,0.75),plotting=TRUE, lty=1, cols=2)



