library(pocrm)


### Name: pocrm.sim
### Title: Simulating the PO-CRM
### Aliases: pocrm.sim

### ** Examples


#All specifications refer to example in Wages, Conaway and O'Quigley (2011a).

#True toxicity rates of Scenario 1 in Table 4.
r<-c(0.06,0.08,0.10,0.15,0.10,0.12,0.30,0.45,0.15,0.30,0.50,0.60,0.50,0.55,0.60,0.70)

#Specifiy the possible orderings from Section 3.3.
orders<-matrix(nrow=3,ncol=16)
orders[1,]<-c(1,2,5,3,6,9,4,7,10,13,8,11,14,12,15,16)
orders[2,]<-c(1,5,2,3,6,9,13,10,7,4,8,11,14,15,12,16)
orders[3,]<-c(1,5,2,9,6,3,13,10,7,4,14,11,8,15,12,16)

#Specify the skeleton values.
skeleton<-getprior(0.05,0.30,8,16)

#Initial guesses of toxicity probabilities for each ordering.
alpha<-getwm(orders,skeleton)

#We consider all orders to be equally likely prior to the study.
prior.o<-rep(1/3,3)

#Initial escalation in Stage 1 proceeds according to the zones in Figure 1.
#Single patient cohorts are used.
x0<-c(rep(1,1),rep(2,1),rep(5,1),rep(3,1),rep(6,1),rep(9,1),rep(4,1),rep(7,1),rep(10,1),rep(13,1),
rep(8,1),rep(11,1),rep(14,1),rep(12,1),rep(15,1),rep(16,1))

#Number of patients used to define stopping rule
stop<-61

#Maximum sample size.
n<-60

#The target toxicity rate
theta<-0.30

#Number of simulations
nsim<-2

#Definition of acceptable DLT rates
tox.range<-0.05

fit<-pocrm.sim(r,alpha,prior.o,x0,stop,n,theta,nsim,tox.range)
fit



