library(PathSelectMP)


### Name: ConvertData3
### Title: Used to make multiple list names for imputations
### Aliases: ConvertData3
### Keywords: helper

### ** Examples

## Don't show: 
ConvertData3<-function(N1,N2,List1){
		NewList=c()
		for(i in 1:length(List1)){
			NewList=c(NewList,list(c((paste0(N1,List1[i])),(paste0(N2,List1[i])),c((List1[i])))))
			}
		return(NewList)}
## End(Don't show)
NumImpute=3
startSeedImputations=1000
NumImpList=seq(startSeedImputations,(startSeedImputations+NumImpute-1),1)
DataFileName="NewData"
NameFile="New"
NameFile=paste0(NameFile,"_")
DataFileName=paste0(DataFileName,"_")
AllData=ConvertData3(NameFile,DataFileName,NumImpList)



