library(plsgenomics)


### Name: rpls.cv
### Title: Determination of the ridge regularization parameter and the
###   number of PLS components to be used for classification with RPLS for
###   binary data
### Aliases: rpls.cv logit.pls.cv

### ** Examples

## Not run: 
##D ## between 5~15 seconds
##D # load plsgenomics library
##D library(plsgenomics)
##D 
##D # load Colon data
##D data(Colon)
##D IndexLearn <- c(sample(which(Colon$Y==2),12),sample(which(Colon$Y==1),8))
##D 
##D # preprocess data
##D res <- preprocess(Xtrain= Colon$X[IndexLearn,], Xtest=Colon$X[-IndexLearn,],
##D                     Threshold = c(100,16000),Filtering=c(5,500),
##D                     log10.scale=TRUE,row.stand=TRUE)
##D # the results are given in res$pXtrain and res$pXtest
##D 
##D # Determine optimum ncomp and lambda
##D nl <- rpls.cv(Ytrain=Colon$Y[IndexLearn]-1,Xtrain=res$pXtrain,LambdaRange=c(0.1,1),ncompMax=3)
##D 
##D # perform prediction by RPLS
##D resrpls <- rpls(Ytrain=Colon$Y[IndexLearn]-1,Xtrain=res$pXtrain,Lambda=nl$Lambda,
##D 			ncomp=nl$ncomp,Xtest=res$pXtest)
##D sum(resrpls$Ytest!=Colon$Y[-IndexLearn]-1)
##D 
## End(Not run)



