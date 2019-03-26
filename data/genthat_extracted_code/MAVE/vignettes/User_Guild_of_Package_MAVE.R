### R code from vignette source 'User_Guild_of_Package_MAVE.Rnw'

###################################################
### code chunk number 1: User_Guild_of_Package_MAVE.Rnw:29-39
###################################################
library(MAVE)
data(Concrete)
set.seed(1234)
train <- sample(1:1030)[1:500]
x.train <- as.matrix(Concrete[train, 1:8])
y.train <- as.matrix(Concrete[train, 9])
x.test  <- as.matrix(Concrete[-train, 1:8])
y.test  <- as.matrix(Concrete[-train, 9])
dr.mave <- mave(y.train~x.train,method = 'MEANOPG', max.dim = 8)
dr.mave


###################################################
### code chunk number 2: User_Guild_of_Package_MAVE.Rnw:42-43
###################################################
dir2 <- coef(dr.mave, dim = 2)


###################################################
### code chunk number 3: User_Guild_of_Package_MAVE.Rnw:46-52
###################################################
library(mda)
x.train.mave <- mave.data(dr.mave, x = x.train , dim = 2)
x.test.mave <- mave.data(dr.mave,x = x.test, dim = 2)
model.mars <- mars(x.train.mave, y.train, degree=2)
y.pred.mars <- predict(model.mars, x.test.mave)
mean((y.pred.mars - y.test) ^ 2)


###################################################
### code chunk number 4: User_Guild_of_Package_MAVE.Rnw:55-57
###################################################
y.pred <- predict(dr.mave, newx = x.test, dim = 2, degree = 2)
mean((y.pred - y.test) ^ 2)


###################################################
### code chunk number 5: User_Guild_of_Package_MAVE.Rnw:60-74
###################################################
set.seed(12345)
n=800
x <- matrix(rnorm(n*5), n, 5)
beta1 <- matrix(c(0.717,0.717,0,0,0))
beta2 <- matrix(c(0,0,0.717,0.717,0))
beta3 <- matrix(c(0,0,0,0,1))
err1 <- matrix(rnorm(n))
err2 <- matrix(rnorm(n))
y1 <- as.matrix((x %*% beta1) / (1 + 2 * (x %*% beta2) ^ 2) + (x %*% beta3) * err1)
y2 <- as.matrix((x%*%beta3)^2) + err2
y = cbind(y1,y2)
dr.mave <- mave(y~x, method = 'CSOPG')
dr.mave.dim <- mave.dim(dr.mave)
dr.mave.dim


###################################################
### code chunk number 6: User_Guild_of_Package_MAVE.Rnw:77-78
###################################################
which.min(dr.mave.dim$cv)


###################################################
### code chunk number 7: User_Guild_of_Package_MAVE.Rnw:81-82
###################################################
coef(dr.mave,dim=3)


###################################################
### code chunk number 8: User_Guild_of_Package_MAVE.Rnw:85-93
###################################################
set.seed(12345)
n <- 200
p <- 500
x <- matrix(rnorm(n*p), n, p)
y <- x[,1]+x[,2]+rnorm(n)
dr.mave <- mave(y~x, method = 'MEANOPG')
dr.mave.dim <- mave.dim(dr.mave)
dr.mave.dim


