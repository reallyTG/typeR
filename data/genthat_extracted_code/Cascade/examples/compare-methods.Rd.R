library(Cascade)


### Name: compare-methods
### Title: Some basic criteria of comparison between actual and inferred
###   network.
### Aliases: compare-methods compare compare,network,network,numeric-method

### ** Examples

data(simul)

#Comparing true and inferred networks
F_score=NULL

#Here are the cutoff level tested
test.seq<-seq(0,max(abs(Net_inf@network*0.9)),length.out=200)
for(u in test.seq){
	F_score<-rbind(F_score,Cascade::compare(Net,Net_inf,u))
}
matplot(test.seq,F_score,type="l",ylab="criterion value",xlab="cutoff level",lwd=2)



