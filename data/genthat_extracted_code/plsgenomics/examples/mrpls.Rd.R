library(plsgenomics)


### Name: mrpls
### Title: Ridge Partial Least Square for categorical data
### Aliases: mrpls

### ** Examples

# load plsgenomics library
library(plsgenomics)

# load SRBCT data
data(SRBCT)
IndexLearn <- c(sample(which(SRBCT$Y==1),10),sample(which(SRBCT$Y==2),4),
			sample(which(SRBCT$Y==3),7),sample(which(SRBCT$Y==4),9))

# perform prediction by MRPLS
res <- mrpls(Ytrain=SRBCT$Y[IndexLearn]-1,Xtrain=SRBCT$X[IndexLearn,],Lambda=0.001,ncomp=2,
			Xtest=SRBCT$X[-IndexLearn,])
sum(res$Ytest!=SRBCT$Y[-IndexLearn]-1)

# prediction for another sample
Xnew <- SRBCT$X[83,]
# Compute the linear predictor for each classes expect class 1
eta <- diag(t(cbind(c(1,Xnew),c(1,Xnew),c(1,Xnew))) %*% res$Coefficients)
Ypred <- which.max(c(0,eta))
Ypred+1
SRBCT$Y[83]




