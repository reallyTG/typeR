library(spgs)


### Name: chargaff.gibbs.test
### Title: Test of CSPR for Dinucleotides Under Gibbs Distribution
### Aliases: chargaff.gibbs.test
### Keywords: htest

### ** Examples

#Demonstration on real bacterial sequence
data(nanoarchaeum)
chargaff.gibbs.test(nanoarchaeum)

#Simulate synthetic DNA sequence that does not satisfy Chargaff's second parity rule
trans.mat <- matrix(c(.4, .1, .4, .1, .2, .1, .6, .1, .4, .1, .3, .2, .1, .2, .4, .3), 
ncol=4, byrow=TRUE)
seq <- simulateMarkovChain(500000, trans.mat, states=c("a", "c", "g", "t"))
chargaff.gibbs.test(seq)



