library(qkerntool)


### Name: qkpca-class
### Title: Class "qkpca"
### Aliases: qkpca-class rotated rotated<- pcv pcv<- eVal,qkpca-method
###   pcv,qkpca-method rotated,qkpca-method eVal<-,qkpca-method
###   pcv<-,qkpca-method rotated<-,qkpca-method
### Keywords: classes

### ** Examples

  # another example using the iris data
  data(iris)
  test <- sample(1:150,20)
  qkpc <- qkpca(~.,iris[-test,-5], kernel = "rbfbase",
                qpar = list(sigma = 50, q = 0.8), features = 2)

  # print the principal component vectors
  pcv(qkpc)
  rotated(qkpc)
  cndkernf(qkpc)
  eVal(qkpc)
  xmatrix(qkpc)
  names(eVal(qkpc))



