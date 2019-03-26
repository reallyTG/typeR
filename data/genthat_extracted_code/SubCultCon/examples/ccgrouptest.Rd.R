library(SubCultCon)


### Name: ccgrouptest
### Title: Function to test the null hypothesis that the two groups have
###   the same answer key, versus the alternative hypothesis that the two
###   groups have answer keys that differ for at least one question.
### Aliases: ccgrouptest
### Keywords: cultural consensus maximum likelihood hypothesis test

### ** Examples

## example with simulated data for 9 informants answering 7 questions
## there are 4 possible answers per question
## there are two subgroups with answer keys that differ in 3 questions
## five informants in group 1 and four in group 2
n=9
m=7
nl=4
group=c(1,1,1,1,1,2,2,2,2)
key=matrix(nrow=m,ncol=2)
key[,1]=trunc(runif(m)*nl+1)
key[,2]=key[,1];key[5:7,2]=5-key[5:7,1]
answermat=matrix(nrow=n,ncol=m)
comp=round(rbeta(n,3,1),4)
for(i in 1:n){for(j in 1:m){
		if(runif(1)<comp[i]){
			answermat[i,j]=key[j,group[i]]
		}else{answermat[i,j]=trunc(runif(1)*nl)+1}
}}
ans=ccgrouptest(answermat,group)
rng=c(min(ans$simdist),max(max(ans$simdist),ans$diff))
par(mar=c(3,4,1,1))
 hist(ans$simdist,br=0:20/20*(rng[2]-rng[1])+rng[1],main="Simulated Null Distribution")
points(ans$diff,0,pch="X",cex=1.3,col=2)
ans$pval  ## here is the p-value
###for a longer-running example, un-comment
#data(village)
#ans=ccgrouptest(village$answermat,village$group) ## takes a few minutes to simulate distribution
#par(mar=c(3,4,3,1))
#hist(ans$simdist,br=0:50/50*(ans$diff-min(ans$simdist))+min(ans$simdist),
#main="simulated distribution of test statistic
#observed value is X")
#points(ans$diff,0,pch="X",cex=1.2,col=2)
#ans$pval  # the computed p-value is zero because the observed test statistic 
#                  #  is larger than all simulated values



