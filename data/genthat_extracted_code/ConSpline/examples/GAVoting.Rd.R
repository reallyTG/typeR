library(ConSpline)


### Name: GAVoting
### Title: Voting Data for Counties in Georgia, for the 2000 U.S.
###   Presidential Election
### Aliases: GAVoting
### Keywords: datasets

### ** Examples

data(GAVoting)
obs1=1:5
obs2=1:3
meth=1:159
econ=1:159
types=unique(GAVoting$method)
econs=unique(GAVoting$econ)
for(i in 1:159){
	meth[i]=obs1[GAVoting$method[i]==types]
	econ[i]=obs2[GAVoting$econ[i]==econs]
}
punc=100*(1-GAVoting$votes/GAVoting$ballots)
par(mar=c(4,4,1,1))
plot(GAVoting$percent.black,punc,xlab="Proportion of black voters",
  ylab="percent uncounted votes",col=meth,pch=econ)
legend(0,18.5,pch=1:3,legend=c("poor","middle","rich"))
legend(.63,18.5,pch=c(1,1,1,1,1),col=1:5,
  legend=c("lever","OS-CC","OS-PC","punch","paper"))

zmat=matrix(0,ncol=4,nrow=159)
for(i in 1:4){zmat[meth==i+1,i]=1}

ans1=conspline(punc,GAVoting$percent.black,1,zmat,wt=GAVoting$ballots)
lines(sort(GAVoting$percent.black),
   ans1$fhat[order(GAVoting$percent.black)],col=1)
for(i in 1:4){
	lines(sort(GAVoting$percent.black),
	ans1$fhat[order(GAVoting$percent.black)]+ans1$zcoef[i],col=i+1)
}



