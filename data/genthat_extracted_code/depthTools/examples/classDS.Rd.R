library(depthTools)


### Name: classDS
### Title: Distance to the Trimmed Mean Classification Method
### Aliases: classDS
### Keywords: multivariate

### ** Examples

  ## simulated data
  set.seed(10)
  xl <- matrix(rnorm(100),10,10); xl[1:5,]<-xl[1:5,]+1
  yl <- c(rep(0,5),rep(1,5))
  xt <- matrix(rnorm(100),10,10)
  classDS(xl,yl,xt)

  ## real data
  data(prostate)
  prost.x<-prostate[,1:100]
  prost.y<-prostate[,101]
  set.seed(1)
  learning <- sample(50,40,replace=FALSE) 
  yl <- prost.y[learning]   
  xl <- prost.x[learning,]
  training <- c(1:nrow(prost.x))[-learning]
  yt.real <- prost.y[training]
  xt <- prost.x[training,] 
  yt.estimated <- classDS(xl,yl,xt)
  yt.real==yt.estimated
  



