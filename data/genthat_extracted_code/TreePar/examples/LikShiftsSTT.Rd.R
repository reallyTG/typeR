library(TreePar)


### Name: LikShiftsSTT
### Title: LikShiftsSTT: Calculates likelihood of piecewise constant birth
###   and death rates for a given phylogenetic tree with sequentially
###   sampled tips.
### Aliases: LikShiftsSTT

### ** Examples


###################################################
# Generating a tree
set.seed(1)
rootlength<-1
test0<-read.tree(text="((3:1.5,4:0.5):1,(1:2,2:1):3);")
test<-addroot(test0,rootlength)
test$Nnode<-4
test$states<-rep(1,4)
times<-getx(test,sersampling=1)[,1]
ttype<-getx(test,sersampling=1)[,2]
times0<-getx(test0,sersampling=1)[,1]
ttype0<-getx(test0,sersampling=1)[,2]
###################################################

# Likelihood calculation
# Tree with root edge
print(-LikShiftsSTT(c(2,1,0.8,0.5,1.5345),
times,ttype,sampling=0,sprob=c(1/3,2/3),survival=1,root=0)  )
# Tree without root edge
print(-LikShiftsSTT(c(2,1,0.8,0.5,1.5345),
times0,ttype0,sampling=0,sprob=c(1/3,2/3),survival=1,root=1)  )


###################################################
# This little example shows that in the case of constant rates, 
# LikShiftsSTT and LikTypesSTT yield the same results.
# In LikShiftsSTT root=0 or 1 allowed. In LikTypesSTT only root=0 possible.
death2<-c(3/2)
sampprob2<-c(1/3)
lambda2<-c(2)
t2<-c(0)
par2<-c(lambda2,death2)
#collapse to 1 state
epsi<- 0
test$states<-rep(1,4)
root<-0
for (survival in c(0,1)) {
print(-LikShiftsSTT(par2,times,ttype,sampling=0,sprob=sampprob2,survival=survival,root=root) )
print(-LikShiftsSTT(c(lambda2,lambda2,death2,death2,(max(times)*0.2431)),
times,ttype,sampling=0,sprob=c(sampprob2,sampprob2),survival=survival,root=root)  )
print(-LikShiftsSTT(par2,times,ttype,sampling=0,
sprob=c(sampprob2),root=root,survival=survival) )
print(-LikTypesSTT(c(lambda2,epsi,epsi,epsi,death2,epsi,0,0),test,
sampfrac=c(sampprob2,0),survival=survival,rtol=10e-10,atol=10e-10,freq=1,migr=0))
print(-LikTypesSTT(c(lambda2,epsi,epsi,epsi,death2,epsi,0,0),test,
sampfrac=c(sampprob2,0),survival=survival,rtol=10e-10,atol=10e-10,freq=1,migr=1)) 
print(" ")
}



