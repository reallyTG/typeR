library(qkerntool)


### Name: qsammon-class
### Title: Class "qsammon"
### Aliases: qsammon-class dimRed dimRed<- fun dimRed,qsammon-method
###   dimRed<-,qsammon-method
### Keywords: classes

### ** Examples

  data(iris)
  train <- as.matrix(iris[,1:4])
  labeltrain<- as.integer(iris[,5])
  ## S4 method for signature 'matrix'
  qkpc <- qsammon(train, kernel = "rbfbase", qpar = list(sigma = 0.5, q = 0.9),
                   dims = 2, Initialisation = 'pca', MaxHalves = 50)

  cndkernf(qkpc)
  dimRed(qkpc)
  kcall(qkpc)



