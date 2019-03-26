library(sparseBC)


### Name: sparseBC-package
### Title: Fit sparse biclustering and matrix-variate normal biclustering
### Aliases: sparseBC-package
### Keywords: package

### ** Examples

# An example that violates the assumption of contiguous biclusters
# Create mean matrix and the data matrix
#set.seed(5)
#u<-c(10,9,8,7,6,5,4,3,rep(2,17),rep(0,75))
#v<-c(10,-10,8,-8,5,-5,rep(3,5),rep(-3,5),rep(0,34))
#u<-u/sqrt(sum(u^2))
#v<-v/sqrt(sum(v^2))
#d<-50
#mus<-d*tcrossprod(u,v)
#binaryX<-(mus!=0)*1
#X<-mus+matrix(rnorm(100*50),100,50)
#X<-X-mean(X)

# The number of biclusters are chosen automatically
# Commented out for short run-time
#KR<-sparseBC.choosekr(X,1:6,1:6,0,0.1,trace=TRUE)
#k<-KR$estimated_kr[1]
#r<-KR$estimated_kr[2]

# The value of lambda is chosen automatically
#lambda<-sparseBC.BIC(X,k,r,c(0,10,20,30,40,50))$lambda

# Perform sparse biclustering using the K, R, and lambda chosen
#biclustering<-sparseBC(X,k,r,lambda)

# Display some information on the object sparseBC
#summary(biclustering)

# Plot the estimated mean matrix from sparseBC
#image(biclustering)



