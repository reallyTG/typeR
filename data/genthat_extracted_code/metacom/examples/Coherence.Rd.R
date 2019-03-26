library(metacom)


### Name: Coherence
### Title: Determines coherence
### Aliases: Coherence

### ** Examples


#define an interaction matrix
data(TestMatrices)
intmat=TestMatrices[[7]]

#determine coherence of interaction matrix
coh.intmat <- Coherence(intmat, method='r1', sims=100, 
  scores=1, order=TRUE, binary=TRUE)

#return results
coh.intmat




