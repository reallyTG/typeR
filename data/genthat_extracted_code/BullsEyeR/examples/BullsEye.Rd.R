library(BullsEyeR)


### Name: BullsEye
### Title: Topic Modelling
### Aliases: BullsEye

### ** Examples

## Not run: 
##D # Run it and see for yourself
## End(Not run)
data.tmp<-read.csv(system.file("ext", "testdata.csv", package="BullsEyeR"))
ds<-as.character(data.tmp$Story[1:2])
stopwords<-c("sallin","hannah","company","number","started","unlike")
BullsEye(ds=ds,spvar=0.99,myStopWords=stopwords,tno=20,seedno=12345,stemvar=0)



