library(CNull)


### Name: permutation.communities.b
### Title: Produces random pairs of communities from a given matrix, based
###   on the permutation (SIM2) null model. These communities can be used
###   for beta diversity computations
### Aliases: permutation.communities.b

### ** Examples

require(CNull)

#Create a random integer matrix
comm = matrix(sample(1:300),nrow=15,ncol=20)

#Use permutation model to produce 2000 random pairs of communities 
permutation.communities.b(comm,reps=2000)



