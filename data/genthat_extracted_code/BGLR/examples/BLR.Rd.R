library(BGLR)


### Name: BLR
### Title: Bayesian Linear Regression
### Aliases: BLR
### Keywords: models

### ** Examples

## Not run: 
##D ########################################################################
##D ##Example 1:
##D ########################################################################
##D 
##D rm(list=ls())
##D setwd(tempdir())
##D library(BGLR)
##D data(wheat)     #Loads the wheat dataset
##D 
##D y=wheat.Y[,1]
##D ### Creates a testing set with 100 observations
##D whichNa<-sample(1:length(y),size=100,replace=FALSE)
##D yNa<-y
##D yNa[whichNa]<-NA
##D 
##D ### Runs the Gibbs sampler
##D fm<-BLR(y=yNa,XL=wheat.X,GF=list(ID=1:nrow(wheat.A),A=wheat.A),
##D                            prior=list(varE=list(df=3,S=0.25),
##D                            varU=list(df=3,S=0.63),
##D                            lambda=list(shape=0.52,rate=1e-4,
##D                            type='random',value=30)),
##D                            nIter=5500,burnIn=500,thin=1)
##D 
##D MSE.tst<-mean((fm$yHat[whichNa]-y[whichNa])^2)
##D MSE.tst
##D MSE.trn<-mean((fm$yHat[-whichNa]-y[-whichNa])^2)
##D MSE.trn
##D COR.tst<-cor(fm$yHat[whichNa],y[whichNa])
##D COR.tst
##D COR.trn<-cor(fm$yHat[-whichNa],y[-whichNa])
##D COR.trn
##D 
##D plot(fm$yHat~y,xlab="Phenotype",
##D      ylab="Pred. Gen. Value" ,cex=.8)
##D points(x=y[whichNa],y=fm$yHat[whichNa],col=2,cex=.8,pch=19)
##D 
##D x11()
##D plot(scan('varE.dat'),type="o",
##D         ylab=expression(paste(sigma[epsilon]^2)))
##D 
##D ########################################################################
##D #Example 2: Ten fold, Cross validation, environment 1,
##D ########################################################################
##D 
##D rm(list=ls())
##D setwd(tempdir())
##D library(BGLR)
##D data(wheat)     #Loads the wheat dataset
##D nIter<-1500     #For real data sets more samples are needed
##D burnIn<-500     
##D thin<-10
##D folds<-10
##D y<-wheat.Y[,1]
##D A<-wheat.A
##D 
##D priorBL<-list(
##D                varE=list(df=3,S=2.5),
##D                varU=list(df=3,S=0.63),
##D                lambda = list(shape=0.52,rate=1e-5,value=20,type='random')
##D              )
##D              
##D set.seed(123)  #Set seed for the random number generator
##D sets<-rep(1:10,60)[-1]
##D sets<-sets[order(runif(nrow(A)))]
##D COR.CV<-rep(NA,times=(folds+1))
##D names(COR.CV)<-c(paste('fold=',1:folds,sep=''),'Pooled')
##D w<-rep(1/nrow(A),folds) ## weights for pooled correlations and MSE
##D yHatCV<-numeric()
##D 
##D for(fold in 1:folds)
##D {
##D    yNa<-y
##D    whichNa<-which(sets==fold)
##D    yNa[whichNa]<-NA
##D    prefix<-paste('PM_BL','_fold_',fold,'_',sep='')
##D    fm<-BLR(y=yNa,XL=wheat.X,GF=list(ID=(1:nrow(wheat.A)),A=wheat.A),prior=priorBL,
##D                nIter=nIter,burnIn=burnIn,thin=thin)
##D    yHatCV[whichNa]<-fm$yHat[fm$whichNa]
##D    w[fold]<-w[fold]*length(fm$whichNa)
##D    COR.CV[fold]<-cor(fm$yHat[fm$whichNa],y[whichNa])
##D }
##D 
##D COR.CV[11]<-mean(COR.CV[1:10])
##D COR.CV
##D 
##D ########################################################################
## End(Not run)



