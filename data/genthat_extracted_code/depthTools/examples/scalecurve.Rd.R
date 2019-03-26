library(depthTools)


### Name: scalecurve
### Title: Computation and Representation of the Scale Curve
### Aliases: scalecurve
### Keywords: multivariate

### ** Examples

## scale curve of a single data set
  ## simulated data
  set.seed(0)  
  x <- matrix(rnorm(100),10,10)
  scalecurve(x)

  ## real data
  data(prostate)
  prost.x<-prostate[,1:100]
  prost.y<-prostate[,101]
  scalecurve(prost.x[prost.y==0,])  ## scale curve of normal samples
  scalecurve(prost.x[prost.y==1,])  ## scale curve of tumoral samples
  
## scalecurve of different groups 
  ## simulated data
  x <- matrix(rnorm(100),10,10)
  y <- c(rep("tumoral",5),rep("normal",5))
  scalecurve(x,y)

  ## real data
  labels<-prost.y 
  labels[prost.y==0]<-"normal"; labels[prost.y==1]<-"tumoral"
  scalecurve(prost.x,labels)  



