library(qkerntool)


### Name: qkMDS-class
### Title: qKernel Metric Multi-Dimensional Scaling
### Aliases: qkMDS-class prj,qkMDS-method dims,qkMDS-method
###   connum,qkMDS-method Residuals,qkMDS-method eVal,qkMDS-method
###   eVec,qkMDS-method prj<-,qkMDS-method dims<-,qkMDS-method
###   connum<-,qkMDS-method Residuals<-,qkMDS-method eVal<-,qkMDS-method
###   eVec<-,qkMDS-method
### Keywords: classes

### ** Examples

   # another example using the iris
  data(iris)
  testset <- sample(1:150,20)
  train <- as.matrix(iris[-testset,-5])
  labeltrain<- as.integer(iris[-testset,5])
  test <- as.matrix(iris[testset,-5])
  # ratibase(c=1,q=0.8)
  d_low = qkMDS(train, kernel = "ratibase", qpar = list(c=1,q=0.8),
                    dims=2, plotResiduals = TRUE)
  #plot the data projection on the components
  plot(prj(d_low),col=labeltrain, xlab="1st Principal Component",ylab="2nd  Principal Component")

  prj(d_low)
	dims(d_low)
	Residuals(d_low)
	eVal(d_low)
	eVec(d_low)
	kcall(d_low)
	cndkernf(d_low)



