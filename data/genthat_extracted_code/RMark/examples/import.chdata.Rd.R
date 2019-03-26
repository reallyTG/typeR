library(RMark)


### Name: import.chdata
### Title: Import capture-recapture data sets from space or tab-delimited
###   files
### Aliases: import.chdata
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
pathtodata=paste(path.package("RMark"),"extdata",sep="/")
example.data<-import.chdata(paste(pathtodata,"example.data.txt",sep="/"),
      field.types=c("n","f","f","f"))
edwards.eberhardt<-import.chdata(paste(pathtodata,"edwardsandeberhardt.txt",
      sep="/"),field.names="ch",header=FALSE)
dipper<-import.chdata(paste(pathtodata,"dipper.txt",sep="/"),
      field.names=c("ch","sex"),header=FALSE)
## End(No test)



