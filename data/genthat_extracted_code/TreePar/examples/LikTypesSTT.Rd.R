library(TreePar)


### Name: LikTypesSTT
### Title: LikTypesSTT: Calculates the likelihood of the 2-type birth-death
###   model parameters for a given tree.
### Aliases: LikTypesSTT

### ** Examples

set.seed(1)
lambda11<-15
lambda12<-3
lambda21<-1
lambda22<-3
death1<-4
death2<-4
sampprob1<-0.05
sampprob2<-0.05
l<-rbind(c(lambda11,lambda12),c(lambda21,lambda22))
d<-c(death1,death2)
s<-c(sampprob1,sampprob2)
n<-20
init<- -1     

tree<-sim.bdtypes.stt.taxa(n,l,d,s,init)
tree<-addroot(tree,tree$root.edge)
## No test: 
# Calculate likelihood for lambda11=15,lambda12=lambda21=lambda22=mu1=mu2=2,gamma=0
LikTypesSTT(par=c(2,2,2,2),phylo=tree,
fix=rbind(c(1,6,7,8),c(15,-5,0,0),c(1,1,1,1)),sampfrac=s,survival=0,posR=0)
# Calculate maximum likelihood parameter estimates of lambda12,lambda21,
# lambda22,mu1 constraining lambda11=15,mu2=mu1 and gamma=0.
out<-try(optim(c(2,2,2,2),LikTypesSTT,phylo=tree,fix=rbind(c(1,6,7,8),c(15,-5,0,0),c(1,1,1,1)),
sampfrac=s,survival=0,posR=0,control=list(maxit=10000)))
## End(No test)

### Likelihood calculation assuming a model with exposed class (migr = 2)
# Simulating a tree with exposed class
set.seed(2)
# simulate tree with expected incubation period of 14 days, 
# infectious period of 7 days, and R0 of 1.5:
mu <- c(0,1/7)
lambda <- rbind(c(0,1/14),c(1.5/7,0))
# sampling probability of infectious individuals is 0.35:
sampprob <-c(0,0.35)
# we stop once we have 20 samples:
n <- 20
# we simulate one tree:
numbsim<-1
# We mark first eliminate=10 tips such that we can easily drop them later
# (if deleting these 10 tips, we mimic no sampling close to the outbreak)
trees<-lapply(rep(n,numbsim),sim.bdtypes.stt.taxa,lambdavector=lambda,deathvector=mu,
sampprobvector=sampprob,EI=TRUE,eliminate=10)
tree<-trees[[1]]
origin<-max(getx(tree,sersampling=1)[,1])+tree$root.edge
# delete first eliminate=10 tips:
droptip<-tree$tip.label[which(tree$states == 1)]
phylo<-drop.tip(tree,droptip)
br<-getx(phylo,sersampling=1)
# we only sample after cutoff time:
cutoff<-max(br[which(br[,2]==0),1])*1.01
# add time since origin:
phylo<-addroot(phylo,origin-max(br))
# all tips were infectious:
phylo$states<-rep(2,length(phylo$tip.label))
##
# Evaluate likelihood at parameters used for simulation:
LikTypesSTT(c(0,lambda[1,2],lambda[2,1],0,0,mu[2],0,0),phylo,
sampfrac=sampprob,migr=2,cutoff=cutoff,freq=1)

#####################
#This little verifies the correctness of the implementation by permuting both states and rates

###################################################
test<-read.tree(text="((C:1.5,D:0.5):1,(A:1,B:1):3);")
test<-addroot(test,0.1)
par1<-2
par2<-1
par3<-0.5
par4<-3
par5<-1
par6<-0.5
par7<-1/3
par8<-0.5
###################################################

for (survival in c(0,1)) {
test$states<-c(2,1,2,1)
print(-LikTypesSTT(c(par4,par3,par2,par1,par6,par5,0,0),test,
sampfrac=c(par8,par7),survival=survival,rtol=10e-14,atol=10e-14,migr=0,freq=0.5))
test$states<-c(1,2,1,2)
print(-LikTypesSTT(c(par1,par2,par3,par4,par5,par6,0,0),test,
sampfrac=c(par7,par8),survival=survival,rtol=10e-14,atol=10e-14,migr=0,freq=0.5))
print(" ")
test$states<-c(2,1,2,1)
print(-LikTypesSTT(c(par4,par3,par2,par1,par6,par5,0,0),test,
sampfrac=c(par8,par7),survival=survival,rtol=10e-14,atol=10e-14,migr=1,freq=0.5))
test$states<-c(1,2,1,2)
print(-LikTypesSTT(c(par1,par2,par3,par4,par5,par6,0,0),test,
sampfrac=c(par7,par8),survival=survival,rtol=10e-14,atol=10e-14,migr=1,freq=0.5))
print(" ")
}



