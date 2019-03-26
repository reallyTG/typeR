library(SubCultCon)


### Name: GAmaxcomp
### Title: Determines best assignment of informants into subcultures based
###   on responses to cultural queries.
### Aliases: GAmaxcomp
### Keywords: genetic algorithm cultural consensus maximum likelihood

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
ans=GAmaxcomp(answermat,2,100,100)
ans$keymat
##########
## for an example that takes longer to run:  (uncomment)
#data(contagion)
#ans=GAmaxcomp(contagion$answermat,2,400,100) ## get best two-group solution
#ans$keymat   ## these are the answer keys
#ans$bgrp        ## this is the best assignment
##########



