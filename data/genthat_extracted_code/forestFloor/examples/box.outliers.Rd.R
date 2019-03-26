library(forestFloor)


### Name: box.outliers
### Title: Box Outliers
### Aliases: box.outliers
### Keywords: outlier.filtration

### ** Examples


box.outliers = function (x, limit = 1.5)  {
  x = scale(x)
  x[ x > limit] =  limit
  x[-x > limit] = -limit
  x = x - min(x)
  x = x/(limit * 2)
  return(x)
}
n=1000 #some observations
p = 5  #some dimensions
X = data.frame(replicate(p,rnorm(n))) # a dataset
Xboxed =box.outliers(X,limit=1.5) #applying normalization
plot(Xboxed[,1],Xboxed[,2],col="#00000088") #plot output for first two dimensions



