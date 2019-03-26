library(SubTite)


### Name: GetSubTite
### Title: Gives the subgroup specific optimal dose vector.  Returns a list
###   containing the optimal doses to enroll each subgroup at and the
###   subgroups that should have their accrual suspended temporarily.
### Aliases: GetSubTite

### ** Examples

T1=6
##Reference Time for Toxicity
Target=.3
Upper=c(.95,.95)
n=30
Y=rep(NA,n)
I=rep(NA,n)
Groups = sample(1:2,n,replace=TRUE) - 1
##Group assignment of patients (MUST BE CODED 0,1,2,...)
Doses = sample(1:5,n,replace=TRUE)
##Randomly Generate Dose assignment
x=c(1,2,3,5,7)
Dose=(x-mean(x))/sd(x)
##Vector of standardized doses
##Next we generate the toxicity times based on a true toxicity probability matrix
GroupProb = matrix(rep(NA,length(Dose)*3),nrow=3)
GroupProb[1,]=c(.18,.25,.45,.66,.74)
 ## These are the true toxicity probabilities for each dose and subgroup
GroupProb[2,]=c(.10,.15,.30,.50,.60) +.1
for(b in 1:n){
I[b]= rbinom(1,1   , GroupProb[(Groups[b]+1),Doses[b]])
if(I[b]==0){ Y[b]=T1 }else{ Y[b]=runif(1,0,T1) }}
DoseTried=matrix(c(1,1,0,0,0,1,1,1,1,1),ncol=5,byrow=TRUE)
 ##Doses Tried so far in trial
##Hypermeans for linear terms
meanmu=-0.4467184
meanslope= 0.8861634
MeanInts = -0.5205379
MeanSlopes = 0.1888923
Doses=Dose[Doses]
varint=5
varbeta=1
GetSubTite(Y, I,Doses, Groups, DoseTried, T1,
 Target,  Upper, Dose,  meanmu, meanslope,
  MeanInts,  MeanSlopes ,varint,varbeta)



