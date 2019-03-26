library(qkerntool)


### Name: qkLLE-class
### Title: Class "qkLLE"
### Aliases: qkLLE-class prj,qkLLE-method dims,qkLLE-method
###   eVal,qkLLE-method eVec,qkLLE-method prj<-,qkLLE-method
###   dims<-,qkLLE-method eVal<-,qkLLE-method eVec<-,qkLLE-method
### Keywords: classes

### ** Examples

  ## S4 method for signature 'matrix'
data(iris)
testset <- sample(1:150,20)
train <- as.matrix(iris[-testset,-5])
labeltrain<- as.integer(iris[-testset,5])
test <- as.matrix(iris[testset,-5])
plot(train ,col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# ratibase(c=1,q=0.8)
d_low <- qkLLE(train, kernel = "ratibase", qpar = list(c=1,q=0.8), dims=2, k=5)
#plot the data projection on the components
plot(prj(d_low),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

## S4 method for signature 'qkernmatrix'
# ratibase(c=0.1,q=0.8)
qkfunc <- ratibase(c=0.1,q=0.8)
ktrain1 <- qkernmatrix(qkfunc,train)
d_low <- qkLLE(ktrain1, dims = 2, k=5)
#plot the data projection on the components
plot(prj(d_low),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")
  


