library(sigora)


### Name: sigora-package
### Title: Signature Overrepresentation Analysis
### Aliases: sigora-package
### Keywords: package

### ** Examples

barplot(table(kegH$L1$degs),col="red",
main="distribution of number of functions per gene in KEGG human pathways.",
ylab="frequency",xlab="number of functions per gene")
## creating your own GPS repository
nciH<-makeGPS(pathwayTable=nciTable, saveFile='nciH.rda')
ils<-grep("^IL",idmap[,"Symbol"],value=TRUE)
## signature overrepresentation analysis:
sigRes.ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=3)



