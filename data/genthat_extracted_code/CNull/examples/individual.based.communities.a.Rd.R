library(CNull)


### Name: individual.based.communities.a
### Title: Produces a set of random communities from a given matrix, based
###   on the individual-based null model (Stegen et al. 2013). These
###   communities can be used for alpha diversity computations
### Aliases: individual.based.communities.a

### ** Examples

require(CNull)

#Create a random integer matrix
comm = matrix(sample(1:300),nrow=15,ncol=20)

#Use individual-based model to produce 2000 random communities 
individual.based.communities.a(comm,reps=2000)



