library(kernlab)


### Name: kpca
### Title: Kernel Principal Components Analysis
### Aliases: kpca kpca,formula-method kpca,matrix-method
###   kpca,kernelMatrix-method kpca,list-method predict,kpca-method
### Keywords: cluster

### ** Examples

# another example using the iris
data(iris)
test <- sample(1:150,20)

kpc <- kpca(~.,data=iris[-test,-5],kernel="rbfdot",
            kpar=list(sigma=0.2),features=2)

#print the principal component vectors
pcv(kpc)

#plot the data projection on the components
plot(rotated(kpc),col=as.integer(iris[-test,5]),
     xlab="1st Principal Component",ylab="2nd Principal Component")

#embed remaining points 
emb <- predict(kpc,iris[test,-5])
points(emb,col=as.integer(iris[test,5]))



