library(CNull)


### Name: individual.based.moments.a
### Title: Given a matrix and an alpha diversity measure f, calculates the
###   mean and variance of f based on the individual-based null model
###   (Stegen et al. 2013)
### Aliases: individual.based.moments.a

### ** Examples

#In the next example null-model calculations are
#performed using a function of phylogenetic diversity.
#Hence, we first load the required packages.
require(CNull)
require(ape)
require(PhyloMeasures)

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

#Create 100 random communities with 50 families each
comm = matrix(0,nrow = 100,ncol = length(bird.families$tip.label))
for(i in 1:nrow(comm)) {comm[i,sample(1:ncol(comm),50)] = 1}
colnames(comm) = bird.families$tip.label

#Set function f to be the Phylogenetic Diversity measure (PD)
#as defined in the R package PhyloMeasures.
my.f = function(mt,args){ return (pd.query(args[[1]],mt))}

# This function takes one extra argument, which is a phylogenetic tree.
# Hence, create a list whose only element is the desired tree.
arguments = list()
arguments[[1]] = bird.families

# Calculate the mean and variance of f in the individual-based null
# model using 2000 Monte Carlo randomizations
individual.based.moments.a(comm,f=my.f,args=arguments,reps=2000)



