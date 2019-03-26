library(netcoh)


### Name: rncreg
### Title: Fits a regression model with network cohesion effects.
### Aliases: rncreg
### Keywords: models networks regression

### ** Examples

set.seed(100)

A <- matrix(0,200,200)
A[1:100,1:100] <- 1
A[101:200,101:200] <- 1
diag(A) <- 0

alpha <- c(rep(1,100),rep(-1,100)) + rnorm(200)*0.5
A <- A[c(1:50,101:150,51:100,151:200),c(1:50,101:150,51:100,151:200)]
alpha <- alpha[c(1:50,101:150,51:100,151:200)]

beta <- rnorm(2)

X <- matrix(rnorm(400),ncol=2)

Y <- X

delta <- Y
delta[Y>0] <- 1
delta[Y<=0] <- 0

A1 <- A[1:100,1:100]
X1 <- X[1:100,]
Y1 <- matrix(Y[1:100],ncol=1)
delta1 <- matrix(delta[1:100],ncol=1)


## If one wants to regularize the Laplacian
## by using gamma > 0 in rncreg,
## we suggest use centered data.
#mean.x <- colMeans(X1)
#mean.y <- mean(Y1)
#Y1 <- Y1-mean.y
#X1 <- t(t(X1)-mean.x)
#Y <- Y-mean.y
#X <- t(t(X)-mean.x)

m <- rncreg(A=A1,X=X1,Y=Y1,model="linear",lambda=10,gamma=0,cv=5)
p <- predict(m,full.A=A,full.X=X)

#m <- rncreg(A=A1,X=X1,Y=Y1,model="logistic",lambda=10,gamma=0.01,cv=5)

#m <- rncreg(A=A1,X=X1,dt=data.frame(y=Y1,delta=delta1),model="cox",lambda=10,gamma=0.01,cv=5)


  


