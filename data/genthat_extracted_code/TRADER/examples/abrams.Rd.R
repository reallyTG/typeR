library(TRADER)


### Name: noblabrams
### Title: Nowacki and Abrams 1997, Black and Abrams 2003 or "pure boundary
###   line".
### Aliases: noblabrams
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(relData)
rna<-noblabrams(relData1,black=FALSE) # for Nowacki and Abrams 1997
rba<-noblabrams(relData1,black=TRUE) # Black and Abrams 2003

plotRelease(relData1,rna$change,rna, 1, method="NowackiAbrams",addHLines=c(0.2))
plotRelease(relData1,rba$change,rba, 1, method="BlackAbrams",addHLines=c(0.2,0.5))



