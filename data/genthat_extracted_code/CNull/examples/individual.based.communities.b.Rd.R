library(CNull)


### Name: individual.based.communities.b
### Title: Produces random pairs of communities from a given matrix, based
###   on the individual-based null model (Stegen et al. 2013). These
###   communities can be used for beta diversity computations
### Aliases: individual.based.communities.b

### ** Examples

require(CNull)

#Create a random integer matrix
comm = matrix(sample(1:300),nrow=15,ncol=20)

#Use individual-based model to produce 2000 random pairs of communities 
individual.based.communities.b(comm,reps=2000)



