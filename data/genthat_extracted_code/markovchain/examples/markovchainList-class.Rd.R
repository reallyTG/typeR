library(markovchain)


### Name: markovchainList-class
### Title: Class '"markovchainList"'
### Aliases: markovchainList-class [[,markovchainList-method
###   dim,markovchainList-method predict,markovchainList-method
###   print,markovchainList-method show,markovchainList-method
### Keywords: classes

### ** Examples

showClass("markovchainList")
#define a markovchainList
statesNames=c("a","b")

mcA<-new("markovchain",name="MCA", transitionMatrix=matrix(c(0.7,0.3,0.1,0.9),
byrow=TRUE, nrow=2, dimnames=list(statesNames,statesNames)))

mcB<-new("markovchain", states=c("a","b","c"), name="MCB",
transitionMatrix=matrix(c(0.2,0.5,0.3,0,1,0,0.1,0.8,0.1),
nrow=3, byrow=TRUE))

mcC<-new("markovchain", states=c("a","b","c","d"), name="MCC",
  	transitionMatrix=matrix(c(0.25,0.75,0,0,0.4,0.6,
    0,0,0,0,0.1,0.9,0,0,0.7,0.3), nrow=4, byrow=TRUE)
)
mcList<-new("markovchainList",markovchains=list(mcA, mcB, mcC), 
name="Non - homogeneous Markov Chain")



