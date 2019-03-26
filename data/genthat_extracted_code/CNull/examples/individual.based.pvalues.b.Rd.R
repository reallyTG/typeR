library(CNull)


### Name: individual.based.pvalues.b
### Title: Produces the p-values of a beta diversity measure f on a given
###   matrix, based on the individual-based null model (Stegen et al. 2013)
### Aliases: individual.based.pvalues.b

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

#Set function f to be the Common Branch Length measure (CBL)
#as defined in the R package PhyloMeasures.
my.f = function(mt,args){ return (cbl.query(args[[1]],mt))}

# This function takes one extra argument, which is a phylogenetic tree.
# Hence, create a list whose only element is the desired tree.
arguments = list()
arguments[[1]] = bird.families

#Compute the values of f for all pairs of observed communities in M.
#Turn the resulting matrix with the observed diversity values into a vector  
obs.v=my.f(comm,arguments)
vals = as.vector(t(obs.v))

# Calculate the p-values of f for the communities in comm 
# based on the individual-based model, using 2000 Monte Carlo randomizations.
individual.based.pvalues.b(comm,f=my.f,args=arguments,observed.vals=vals,reps=2000)



