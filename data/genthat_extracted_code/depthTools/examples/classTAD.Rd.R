library(depthTools)


### Name: classTAD
### Title: Weighted Trimmed Mean Distance Classification Method
### Aliases: classTAD
### Keywords: multivariate

### ** Examples

  ## simulated data
  set.seed(0)
  xl <- matrix(rnorm(100),10,10); xl[1:5,]<-xl[1:5,]+1
  yl <- c(rep(0,5),rep(1,5))
  xt <- matrix(rnorm(100),10,10)
  classTAD(xl,yl,xt)
  
  ## real data
  data(prostate)
  prost.x<-prostate[,1:100]
  prost.y<-prostate[,101]
  set.seed(0)
  learning <- sample(50,40,replace=FALSE) 
  yl <- prost.y[learning]   
  xl <- prost.x[learning,]
  training <- c(1:nrow(prost.x))[-learning]
  yt.real <- prost.y[training]
  xt <- prost.x[training,] 
  yt.estimated <- classTAD(xl,yl,xt)
  yt.real==yt.estimated



