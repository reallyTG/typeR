library(plsgenomics)


### Name: mrpls.cv
### Title: Determination of the ridge regularization parameter and the
###   number of PLS components to be used for classification with RPLS for
###   categorical data
### Aliases: mrpls.cv

### ** Examples

## Not run: 
##D ## between 5~15 seconds
##D # load plsgenomics library
##D library(plsgenomics)
##D 
##D # load SRBCT data
##D data(SRBCT)
##D IndexLearn <- c(sample(which(SRBCT$Y==1),10),sample(which(SRBCT$Y==2),4),
##D 			sample(which(SRBCT$Y==3),7),sample(which(SRBCT$Y==4),9))
##D 
##D # Determine optimum ncomp and Lambda
##D nl <- mrpls.cv(Ytrain=SRBCT$Y[IndexLearn]-1,Xtrain=SRBCT$X[IndexLearn,],
##D 			LambdaRange=c(0.1,1),ncompMax=3)
##D 
##D # perform prediction by MRPLS
##D res <- mrpls(Ytrain=SRBCT$Y[IndexLearn]-1,Xtrain=SRBCT$X[IndexLearn,],Lambda=nl$Lambda,
##D 			ncomp=nl$ncomp,Xtest=SRBCT$X[-IndexLearn,])
##D sum(res$Ytest!=SRBCT$Y[-IndexLearn]-1)
## End(Not run)



