library(markovchain)


### Name: verifyMarkovProperty
### Title: Various functions to perform statistical inference of DTMC
### Aliases: verifyMarkovProperty assessOrder assessStationarity
###   verifyEmpiricalToTheoretical verifyHomogeneity

### ** Examples

sequence <- c("a", "b", "a", "a", "a", "a", "b", "a", "b",
              "a", "b", "a", "a", "b", "b", "b", "a")
mcFit <- markovchainFit(data = sequence, byrow = FALSE)
verifyMarkovProperty(sequence)
assessOrder(sequence)
assessStationarity(sequence, 1)


#Example taken from Kullback Kupperman Tests for Contingency Tables and Markov Chains

sequence<-c(0,1,2,2,1,0,0,0,0,0,0,1,2,2,2,1,0,0,1,0,0,0,0,0,0,1,1,
2,0,0,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,2,1,0,
0,2,1,0,0,0,0,0,0,1,1,1,2,2,0,0,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,0,2,
0,1,1,0,0,0,1,2,2,0,0,0,0,0,0,2,2,2,1,1,1,1,0,1,1,1,1,0,0,2,1,1,
0,0,0,0,0,2,2,1,1,1,1,1,2,1,2,0,0,0,1,2,2,2,0,0,0,1,1)

mc=matrix(c(5/8,1/4,1/8,1/4,1/2,1/4,1/4,3/8,3/8),byrow=TRUE, nrow=3)
rownames(mc)<-colnames(mc)<-0:2; theoreticalMc<-as(mc, "markovchain")

verifyEmpiricalToTheoretical(data=sequence,object=theoreticalMc)


data(kullback)
verifyHomogeneity(inputList=kullback,verbose=TRUE)




