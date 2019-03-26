library(PathSelectMP)


### Name: WriteInitialInpFile
### Title: Write Inp File
### Aliases: WriteInitialInpFile
### Keywords: Initialize helper

### ** Examples

## Not run: 
##D InitD=Simulate(MissingYN=1)
##D NumImpute=3
##D startSeedImputations=1000
##D DataFileName="NewData"
##D NameFile="New"
##D Directry=getwd()
##D NADes=c(-99)
##D WhichCat=c(1,1,1,1,0)
##D AllMethods=c("logreg","polr","pmm")
##D WhichImpute=rep(1,ncol(InitD))
##D WhichRowsImp=c(1:nrow(InitD))
##D NumImpList=seq(startSeedImputations,(startSeedImputations+NumImpute-1),1)
##D NameFile=paste0(NameFile,"_")
##D DataFileName=paste0(DataFileName,"_")
##D AllData=ConvertData3(NameFile,DataFileName,NumImpList)
##D InputInitializeMat=CreateInitializeMatrix(InitD,WhichCat,empty=FALSE)
##D IndList=AddOnINDStatements(InputInitializeMat,PasteIND=1)
##D WRt=lapply(AllData,WriteInitialInpFile,InitD,InputInitializeMat,IndList,Directry,
##D NADes,WhichCat,WhichImpute,WhichRowsImp,AllMethods)
## End(Not run)



