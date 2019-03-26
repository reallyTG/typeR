library(yaImpute)


### Name: yaiVarImp
### Title: Reports or plots importance scores for yai method randomForest
### Aliases: yaiVarImp
### Keywords: misc multivariate tree

### ** Examples


if (require(randomForest))
{
  data(MoscowMtStJoe)

  # get the basal area by species columns
  yba  <- MoscowMtStJoe[,1:17]
  ybaB <- whatsMax(yba,nbig=7)  # see help on whatsMax
  
  ba <- cbind(ybaB,TotalBA=MoscowMtStJoe[,18])
  x <- MoscowMtStJoe[,37:64]
  x <- x[,-(4:5)]
  rf <- yai(x=x,y=ba,method="randomForest")
  
  yaiVarImp(rf)
  
  keep=colnames(yaiVarImp(rf,plot=FALSE,nTop=9))
  
  newx <- x[,keep]
  rf2 <- yai(x=newx,y=ba,method="randomForest")
  
  yaiVarImp(rf2,col="gray")
  
  compare.yai(rf,rf2)
}




