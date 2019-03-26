library(plsgenomics)


### Name: mgsim.cv
### Title: Determination of the ridge regularization parameter and the
###   bandwidth to be used for classification with GSIM for categorical
###   data
### Aliases: mgsim.cv

### ** Examples

## Not run: 
##D ## between 5~15 seconds
##D # load plsgenomics library
##D library(plsgenomics)
##D 
##D # load SRBCT data
##D data(SRBCT)
##D IndexLearn <- c(sample(which(SRBCT$Y==1),10),sample(which(SRBCT$Y==2),4),
##D                 sample(which(SRBCT$Y==3),7),sample(which(SRBCT$Y==4),9))
##D 
##D ### Determine optimum h and lambda
##D # /!\ take 30 secondes to run
##D #hl <- mgsim.cv(Ytrain=SRBCT$Y[IndexLearn],Xtrain=SRBCT$X[IndexLearn,],
##D #                            LambdaRange=c(0.1),hRange=c(7,20))
##D 
##D ### perform prediction by MGSIM
##D #res <- mgsim(Ytrain=SRBCT$Y[IndexLearn],Xtrain=SRBCT$X[IndexLearn,],Lambda=hl$Lambda,
##D #             h=hl$h,Xtest=SRBCT$X[-IndexLearn,])
##D #res$Cvg
##D #sum(res$Ytest!=SRBCT$Y[-IndexLearn])
##D 
## End(Not run)



