library(PathSelectMP)


### Name: DatImputations
### Title: Impute Data
### Aliases: DatImputations
### Keywords: Impute helper

### ** Examples

## Not run: 
##D 
##D InitD=Simulate(MissingYN=1,exampleNum=1)
##D WhichCat=c(1,1,1,1,0)
##D WhichImpute=c(rep(1, ncol(InitD)))
##D WhichRowsImp=c(rep(1,nrow(InitD)))
##D AllMethods=c("logreg","polr","pmm")
##D Directry=getwd()
##D ImputeSeed=1000
##D TO=Directry
##D DataFileName="NewData_1000"
##D NameFile="New_1000"
##D TO=paste(TO,"/",NameFile,sep="")
##D DataFileNameS=paste0(TO,"/",DataFileName,".dat")
##D NADes=c(-99)
##D Initialize(InitD,NumImpute=1,WhichCat=c(1,1,1,1,0))
##D DatImputations(InitD,ImputeSeed,NADes,DataFileNameS,WhichCat,WhichImpute,WhichRowsImp,AllMethods)
## End(Not run)



