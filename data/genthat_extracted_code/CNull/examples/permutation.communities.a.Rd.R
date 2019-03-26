library(CNull)


### Name: permutation.communities.a
### Title: Produces a set of random communities from a given matrix, based
###   on the permutation (SIM2) null model. These communities can be used
###   for alpha diversity computations
### Aliases: permutation.communities.a

### ** Examples

require(CNull)

#Create a random integer matrix
comm = matrix(sample(1:300),nrow=15,ncol=20)

#Use permutation model to produce 2000 random communities 
permutation.communities.a(comm,reps=2000)



