library(qkerntool)


### Name: qkgda
### Title: qKernel Generalized Discriminant Analysis
### Aliases: qkgda qkgda,matrix-method qkgda,cndkernmatrix-method
###   qkgda,qkernmatrix-method predict,qkgda-method
### Keywords: classif

### ** Examples

Iris <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]), Sp = rep(c("1","2","3"), rep(50,3)))
testset <- sample(1:150,20)
train <- as.matrix(iris[-testset,-5])
test <- as.matrix(iris[testset,-5])
Sp = rep(c("1","2","3"), rep(50,3))
labels <-as.numeric(Sp)
trainlabel <- labels[-testset]
testlabel <- labels[testset]

kgda1 <- qkgda(train, label=trainlabel, kernel = "ratibase", qpar = list(c=1,q=0.9),features = 2)

prj(kgda1)
eVal(kgda1)
eVec(kgda1)
kcall(kgda1)
# xmatrix(kgda1)

#print the principal component vectors
prj(kgda1)
#plot the data projection on the components
plot(kgda1@prj,col=as.integer(train), xlab="1st Principal Component",ylab="2nd Principal Component")




