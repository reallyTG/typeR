library(qkerntool)


### Name: qkpca
### Title: qKernel Principal Components Analysis
### Aliases: qkpca qkpca,formula-method qkpca,matrix-method
###   qkpca,cndkernmatrix-method qkpca,qkernmatrix-method
###   predict,qkpca-method
### Keywords: cluster

### ** Examples

# another example using the iris data
data(iris)
test <- sample(1:150,20)
qkpc <- qkpca(~.,data=iris[-test,-5],kernel="rbfbase",
              qpar=list(sigma=50,q=0.8),features=2)

# print the principal component vectors
pcv(qkpc)
#plot the data projection on the components
plot(rotated(qkpc),col=as.integer(iris[-test,5]),
     xlab="1st Principal Component",ylab="2nd Principal Component")

# embed remaining points
emb <- predict(qkpc,iris[test,-5])
points(emb,col=as.integer(iris[test,5]))



