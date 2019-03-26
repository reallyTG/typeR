library(pocrm)


### Name: pocrm.imp
### Title: Executing the PO-CRM
### Aliases: pocrm.imp

### ** Examples


#All specifications refer to example in Wages, Conaway and O'Quigley (2011).

#Specify the possible orderings from Table 2
orders<-matrix(nrow=8,ncol=8)
orders[1,]<-c(1,2,3,4,5,6,7,8)
orders[2,]<-c(1,3,2,4,5,6,7,8)
orders[3,]<-c(1,2,3,5,4,6,7,8)
orders[4,]<-c(1,2,3,4,5,7,6,8)
orders[5,]<-c(1,3,2,5,4,6,7,8)
orders[6,]<-c(1,3,2,4,5,7,6,8)
orders[7,]<-c(1,2,3,5,4,7,6,8)
orders[8,]<-c(1,3,2,5,4,7,6,8)

#Specify the skeleton values provided in Table 4.
skeleton<-c(0.01,0.03,0.10,0.20,0.33,0.47,0.60,0.70)

#Initial guesses of toxicity probabilities for each ordering.
alpha<-getwm(orders,skeleton)

#We consider all orders to be equally likely prior to the study.
prior.o<-rep(1/8,8)

#The target toxicity rate
theta<-0.20

#Combinations tried on the first 11 patients in Table 5.
combos<-c(2,3,5,4,7,5,4,3,2,2,3)

#Toxicity outcomes on the first 11 patients in Table 5.
y<-c(0,0,0,0,1,1,1,0,0,1,1)

fit<-pocrm.imp(alpha,prior.o,theta,y,combos)
fit



