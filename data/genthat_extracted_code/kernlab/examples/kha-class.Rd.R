library(kernlab)


### Name: kha-class
### Title: Class "kha"
### Aliases: kha-class eig,kha-method kcall,kha-method kernelf,kha-method
###   pcv,kha-method xmatrix,kha-method eskm,kha-method
### Keywords: classes

### ** Examples

# another example using the iris
data(iris)
test <- sample(1:50,20)

kpc <- kha(~.,data=iris[-test,-5], kernel="rbfdot",
           kpar=list(sigma=0.2),features=2, eta=0.001, maxiter=65)

#print the principal component vectors
pcv(kpc)
kernelf(kpc)
eig(kpc)



