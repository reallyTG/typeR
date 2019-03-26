library(kernlab)


### Name: kpca-class
### Title: Class "kpca"
### Aliases: kpca-class rotated eig,kpca-method kcall,kpca-method
###   kernelf,kpca-method pcv,kpca-method rotated,kpca-method
###   xmatrix,kpca-method
### Keywords: classes

### ** Examples

# another example using the iris
data(iris)
test <- sample(1:50,20)

kpc <- kpca(~.,data=iris[-test,-5],kernel="rbfdot",
            kpar=list(sigma=0.2),features=2)

#print the principal component vectors
pcv(kpc)
rotated(kpc)
kernelf(kpc)
eig(kpc)



