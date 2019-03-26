library(spgs)


### Name: agct.test
### Title: Test of Purine-Pyrimidine Parity Based on Euclidean distance
### Aliases: agct.test
### Keywords: htest

### ** Examples

#Demonstration on real viral sequence
data(pieris)
agct.test(pieris)

#Simulate synthetic DNA sequence that does not exhibit Purine-Pyrimidine parity
trans.mat <- matrix(c(.4, .1, .4, .1, .2, .1, .6, .1, .4, .1, .3, .2, .1, .2, .4, .3), 
ncol=4, byrow=TRUE)
seq <- simulateMarkovChain(500000, trans.mat, states=c("a", "c", "g", "t"))
agct.test(seq)



