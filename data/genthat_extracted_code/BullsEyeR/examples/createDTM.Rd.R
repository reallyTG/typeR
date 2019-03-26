library(BullsEyeR)


### Name: createDTM
### Title: Create Document term Matrix
### Aliases: createDTM

### ** Examples

## Not run: 
##D # Run it and see for yourself
## End(Not run)
data.tmp<-read.csv(system.file("ext", "testdata.csv", package="BullsEyeR"))
ds<-as.character(data.tmp$Story[1:2])
stopwords<-c("sallin","hannah","company","number","started","unlike")
createDTM(ds=ds,spvar=0.99,myStopWords=stopwords,stemvar=0)



