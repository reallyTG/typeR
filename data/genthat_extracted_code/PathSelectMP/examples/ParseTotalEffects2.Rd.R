library(PathSelectMP)


### Name: ParseTotalEffects2
### Title: Parse and Exctract Total Effects
### Aliases: ParseTotalEffects2
### Keywords: Parse

### ** Examples

## Not run: 
##D 
##D InitD=Simulate(MissingYN=0,exampleNum=3)
##D xxx=Initialize(InitD,NumImpute=0,WhichCat=c(1,1,1,1,1,0,1,0),PasteIND=1)
##D ggg=AllBackwardSelect(xxx[[1]])
##D AllDat1=ConvertData2(xxx[[1]],xxx[[2]],yyy[[1]])
##D Directry=getwd()
##D LastFileOut=AllDat1[[1]][[1]]
##D TO=paste(Directry,"/",LastFileOut,sep="")
##D files <- list.files(path=TO,pattern = ".out$")
##D hh=lapply(strsplit(files,"_"),NumEndFile,pattern1=".out",pattern2='out')
##D hh=as.numeric(paste(hh))
##D LastFileName=files[which(hh==max(hh))]
##D x=scan(paste(TO,"/",LastFileName,sep=""),what=character())
##D GG=ParseTotalEffects2(x)
## End(Not run)



