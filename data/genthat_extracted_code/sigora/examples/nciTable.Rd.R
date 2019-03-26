library(sigora)


### Name: nciTable
### Title: NCI human gene-pathway associations.
### Aliases: nciTable
### Keywords: datasets

### ** Examples

data(nciTable)
nciH<-makeGPS(pathwayTable=nciTable)
data(idmap)
ils<-grep("^IL",idmap[,"Symbol"],value=TRUE)
ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=3)



