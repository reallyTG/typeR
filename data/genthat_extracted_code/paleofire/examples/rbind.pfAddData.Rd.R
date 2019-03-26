library(paleofire)


### Name: rbind.pfAddData
### Title: rbind.pfAddData
### Aliases: rbind.pfAddData

### ** Examples

## Not run: 
##D files=c("http://blarquez.com/public/data//Ben.csv",
##D        "http://blarquez.com/public/data/Small.csv")
##D metadata=c("http://blarquez.com/public/data/metadata.csv")
##D 
##D mydata1=pfAddData(files=files,type="CharAnalysis")
##D mydata2=pfAddData(files=files,metadata=metadata,type="CharAnalysis")
##D mydata=rbind(mydata1,mydata2)
##D 
##D TR1=pfTransform(add=mydata, method=c("MinMax","Box-Cox","Z-Score"),
##D                BasePeriod=c(200,2000))
##D COMP2=pfCompositeLF(TR1, tarAge=seq(-50,8000,20), hw=500, nboot=100)
##D plot(COMP2)
## End(Not run)





