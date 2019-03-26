library(BKPC)


### Name: kPCA
### Title: Kernel Principal Components Analysis
### Aliases: kPCA kPCA.default kPCA.kern kPCA.kernelMatrix predict.kPCA
###   getPrincipalComponents
### Keywords: nonlinear cluster

### ** Examples


data(iris)
testset <- sample(1:150,20)

train <- as.matrix(iris[-testset,-5])
test <- as.matrix(iris[testset,-5])


# make training set kernel

gk <- gaussKern(train)
Ktrain <- gk$K
image(Ktrain)

# make testing set kernel

gk2 <- gaussKern(train, test, gk$theta) 
Ktest <- gk2$K


#  make training set kernel using kernelMatrix from library kernlab.

library(kernlab)

kfunc <- laplacedot(sigma = 1)
Ktrain2 <- kernelMatrix(kfunc, train)
image(Ktrain2)

# make testing set kernel using kernelMatrix {kernlab}

Ktest2 <- kernelMatrix(kfunc, test, train)



# Do KPCA:

kpcData <- kPCA(train)
kpcKern <- kPCA(Ktrain)
kpcKern2 <- kPCA(Ktrain2)


# plot the data projection on the principal components

pairs(kpcData$KPCs[ , 1 : 3], col = iris[-testset, 5])

# proportion of variance explained by each PC

plot(kpcData$Es/sum(kpcData$Es), xlab = "PC", ylab = "Proportion of variance")


# embed data from the testing set on the new space:


KPCpred1 <- predict(kpcData, test)

KPCpred2 <- predict(kpcKern, Ktest)

KPCpred3 <- predict(kpcKern2, Ktest2)

#plot the test data projection on the principal components

pairs(KPCpred3[ , 1 : 3], col = iris[testset, 5])







