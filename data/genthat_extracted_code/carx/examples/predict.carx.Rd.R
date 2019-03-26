library(carx)


### Name: predict.carx
### Title: Prediction with a fitted 'carx' object
### Aliases: predict.carx

### ** Examples

 #This is the function to run a simulation study about the empirical coverage rate of 
 #the predictive confidence intervals,
 runSimPredCR <- function(nRep=200,nObs=200,n.ahead=10,
                          saveRslt=FALSE,saveDir='./testPredictCR',
                          seed=NULL)
 {
   if(!is.null(seed))
     set.seed(seed)
   crMat = matrix(nrow=n.ahead,ncol=nRep)
   if(saveRslt)
   {
     dir.create(saveDir,showWarnings=FALSE,recursive=TRUE)
   }

   replication = list()
   simSingle <- function(iRep)
   {
     message(sprintf("iRep: %04d",iRep))
     sdata = carxSim(nObs=nObs+n.ahead)
     trainingData = sdata[1:nObs,]
     testData = sdata[-(1:nObs),]
     mdl = carx(y~X1+X2-1,data=trainingData,p=2)
     newxreg = testData[,c('X1','X2')]
     predVal = predict(mdl,newxreg=newxreg,n.ahead=n.ahead)
     crInd = (predVal$ci[,1] <= testData$y) & (predVal$ci[,2] >= testData$y)
     crMat[,iRep] = crInd
     list(trainingData=trainingData,
          testData=testData,
          fitted=mdl,
          predVal = predVal,
          crInd= crInd)
   }
   replication = lapply(1:nRep,simSingle)
   crMat = sapply(replication,FUN=function(x){x$crInd})
   print(crMat)
   crPred = apply(crMat,1,mean)
   message("empirical coverage rate:")
   print(crPred)
   if(saveRslt)
   { 
     save(replication,file=paste0(saveDir,'/replication.RData'))
     save(crMat,file=paste0(saveDir,'/crMat.RData'))
     save(crPred,file=paste0(saveDir,'/crPred.RData'))
   }

   list(replication=replication,crMat=crMat,meanCR=crPred)
 }
 #note that nRep=2 is for illustration only, for more stable result, use nRep>=500.
 simPredCR = runSimPredCR(nRep=2,nObs=100)
 ## Not run: 
##D    # for more stable simulation result, run with nRep = 500.
##D    simPredCR = runSimPredCR(nRep=500,nObs=100)
##D    message("Empirical coverage rate:")
##D    print(simPredCR$meanCR)
##D  
## End(Not run)



