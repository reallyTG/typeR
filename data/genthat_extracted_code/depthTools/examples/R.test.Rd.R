library(depthTools)


### Name: R.test
### Title: Rank Test Based on the Modified Band Depth
### Aliases: R.test
### Keywords: multivariate

### ** Examples

## Rank test for samples from the same population
  x <- matrix(rnorm(100),10,10)
  R.test(x,x,4,4)$p.value

  ## real data
  data(prostate)
  prost.x<-prostate[,1:100]
  prost.y<-prostate[,101]
  normal<-prost.x[prost.y==0,]
  R.test(normal,normal,10,10)$p.value


##  Rank test for samples from different populations
  x <- matrix(rnorm(100),10,10)
  y <- matrix(rnorm(100,5),10,10)
  R.test(x,y,4,4)$p.value

  ## real data
  tumor<-prost.x[prost.y==1,]
  R.test(normal,tumor,10,10)$p.value





