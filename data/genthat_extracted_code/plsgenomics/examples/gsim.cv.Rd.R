library(plsgenomics)


### Name: gsim.cv
### Title: Determination of the ridge regularization parameter and the
###   bandwidth to be used for classification with GSIM for binary data
### Aliases: gsim.cv

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
##D Xtrain <- Colon$X[IndexLearn,]
##D Ytrain <- Colon$Y[IndexLearn]
##D Xtest <- Colon$X[-IndexLearn,]
##D 
##D # preprocess data
##D resP <- preprocess(Xtrain= Xtrain, Xtest=Xtest,Threshold = c(100,16000),Filtering=c(5,500),
##D 				log10.scale=TRUE,row.stand=TRUE)
##D 
##D # Determine optimum h and lambda
##D hl <- gsim.cv(Xtrain=resP$pXtrain,Ytrain=Ytrain,hARange=c(7,20),LambdaRange=c(0.1,1),hB=NULL)
##D 
##D # perform prediction by GSIM  
##D res <- gsim(Xtrain=resP$pXtrain,Ytrain=Ytrain,Xtest=resP$pXtest,Lambda=hl$Lambda,hA=hl$hA,hB=NULL)
##D res$Cvg
##D sum(res$Ytest!=Colon$Y[-IndexLearn])
## End(Not run)



