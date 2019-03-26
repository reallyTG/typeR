library(ResistorArray)


### Name: hypercube
### Title: Conductance matrix of a Boolean hypercube
### Aliases: hypercube
### Keywords: math

### ** Examples

hypercube(4)

resistance(hypercube(5),1,32)  # cf exact answer of 8/15 
resistance(hypercube(5),1,2)   # cf exact answer of n <- 5; (2^n-1)/(n*2^(n-1))=31/80




