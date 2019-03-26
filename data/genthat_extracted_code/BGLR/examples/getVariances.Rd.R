library(BGLR)


### Name: getVariances
### Title: getVariances
### Aliases: getVariances
### Keywords: models

### ** Examples


## Not run: 
##D #Demos
##D 
##D library(BGLR)
##D data(wheat)
##D y=wheat.Y[,1] ; X=scale(wheat.X)
##D dir.create('test_saveEffects')
##D setwd('test_saveEffects')
##D fm=BGLR(y=y,ETA=list(list(X=X,model='BayesB',saveEffects=TRUE)),nIter=12000,thin=2,burnIn=2000)
##D B=readBinMat('ETA_1_b.bin')
##D plot(B[,1],type='o',col=4)
##D VAR=getVariances(B=B,X=X,sets=sample(1:20,size=1279,replace=T))
##D head(VAR)
##D plot(VAR[,"total"])
##D 
## End(Not run)




