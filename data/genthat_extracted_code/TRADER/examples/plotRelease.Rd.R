library(TRADER)


### Name: plotRelease
### Title: Plot releases according the given method.
### Aliases: plotRelease
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(relData)
rna<-noblabrams(relData1,black=FALSE) # for Nowacki and Abrams 1997
rba<-noblabrams(relData1,black=TRUE) # Black and Abrams 2003

plotRelease(relData1,rna$change,rna, 1, method="NowackiAbrams")
plotRelease(relData1,rba$change,rba, 1, method="BlackAbrams",addHLines=c(0.2,0.5))



