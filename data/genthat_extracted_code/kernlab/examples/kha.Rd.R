library(kernlab)


### Name: kha
### Title: Kernel Principal Components Analysis
### Aliases: kha kha,formula-method kha,matrix-method predict,kha-method
### Keywords: cluster

### ** Examples

# another example using the iris
data(iris)
test <- sample(1:150,70)

kpc <- kha(~.,data=iris[-test,-5],kernel="rbfdot",
           kpar=list(sigma=0.2),features=2, eta=0.001, maxiter=65)

#print the principal component vectors
pcv(kpc)

#plot the data projection on the components
plot(predict(kpc,iris[,-5]),col=as.integer(iris[,5]),
     xlab="1st Principal Component",ylab="2nd Principal Component")




