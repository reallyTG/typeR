library(pvclass)


### Name: pvs.logreg
### Title: P-Values to Classify New Observations (Penalized Multicategory
###   Logistic Regression)
### Aliases: pvs.logreg
### Keywords: classif

### ** Examples

X <- iris[c(1:49, 51:99, 101:149), 1:4]
Y <- iris[c(1:49, 51:99, 101:149), 5]
NewX <- iris[c(50, 100, 150), 1:4]

pvs.logreg(NewX, X, Y, tau.o=1, pen.method="vectors", progress=TRUE)

# A bigger data example: Buerk's hospital data.
## Not run: 
##D data(buerk)
##D X.raw <- as.matrix(buerk[,1:21])
##D Y.raw <- buerk[,22]
##D n0.raw <- sum(1 - Y.raw)
##D n1 <- sum(Y.raw)
##D n0 <- 3*n1
##D 
##D X0 <- X.raw[Y.raw==0,]
##D X1 <- X.raw[Y.raw==1,]
##D 
##D tmpi0 <- sample(1:n0.raw,size=3*n1,replace=FALSE)
##D tmpi1 <- sample(1:n1    ,size=  n1,replace=FALSE)
##D 
##D Xtrain <- rbind(X0[tmpi0[1:(n0-100)],],X1[1:(n1-100),])
##D Ytrain <- c(rep(1,n0-100),rep(2,n1-100))
##D Xtest <- rbind(X0[tmpi0[(n0-99):n0],],X1[(n1-99):n1,])
##D Ytest <- c(rep(1,100),rep(2,100))
##D 
##D PV <- pvs.logreg(Xtest,Xtrain,Ytrain,tau.o=2,progress=TRUE)
##D analyze.pvs(Y=Ytest,pv=PV,pvplot=FALSE)
## End(Not run)



