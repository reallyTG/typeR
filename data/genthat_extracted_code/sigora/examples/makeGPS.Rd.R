library(sigora)


### Name: makeGPS
### Title: Create your own Signature Object.
### Aliases: makeGPS
### Keywords: functions

### ** Examples

data(nciTable)
## what the input looks like:
head(nciTable)
## create a SigObject. use the saveFile parameter for reuse.  
nciH<-makeGPS(pathwayTable=nciTable)
ils<-grep("^IL",idmap[,"Symbol"],value=TRUE)
ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=3)



