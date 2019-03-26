library(BarcodingR)


### Name: consensus.identify
### Title: Consensus Identification
### Aliases: consensus.identify
### Keywords: consensus.identify

### ** Examples


queIDs<-c("q1","q2","q3")

bp<-c("sp1","sp1","sp1")
bpk<-c("sp1","sp1","sp2")
bayes<-c("sp2","sp1","sp3")
fuzzyID<-c("sp1","sp1","sp2")
identifiedBy2orMore<-data.frame(bp=bp,bpk=bpk,bayes=bayes,fuzzyID=fuzzyID)
rownames(identifiedBy2orMore)<-queIDs<-c("q1","q2","q3")
ccs<-consensus.identify(identifiedBy2orMore)



