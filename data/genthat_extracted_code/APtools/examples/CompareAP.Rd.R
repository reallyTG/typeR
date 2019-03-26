library(APtools)


### Name: CompareAP
### Title: Comparison of two risk scores based on the differences and ratio
###   of their APs.
### Aliases: CompareAP

### ** Examples

library(APtools)
status=c(rep(1,10),rep(0,1),rep(1,18),rep(0,11),rep(1,25),
	rep(0,44),rep(1,85),rep(0,176))
marker1=c(rep(7,11),rep(6,29),rep(5,69),rep(4,261))
marker2=c(rep(7,17),rep(6,29),rep(5,70),rep(4,254))
out_binary <- CompareAP(status,marker1,marker2)
out_binary
data(mayo)
t0.list=seq(from=min(mayo[,1]),to=max(mayo[,1]),length.out=5)[-c(1,5)]
out_survival <- CompareAP(status=mayo[,2],marker1=mayo[,3],
	marker2=mayo[,4],stime=mayo[,1],t0.list=t0.list,
	method='bootstrap',alpha=0.90,B=500,
	weight=rep(1,nrow(mayo)),Plot=FALSE)
out_survival



