library(PhyloMeasures)


### Name: pd.pvalues
### Title: Computes the p-values of the unrooted Phylogenetic Diversity
###   measure
### Aliases: pd.pvalues

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

#Create 100 random communities with 50 families each
comm = matrix(0,nrow = 100,ncol = length(bird.families$tip.label))
for(i in 1:nrow(comm)) {comm[i,sample(1:ncol(comm),50)] = 1}
colnames(comm) = bird.families$tip.label

#Calculate p-values under the uniform model
pd.pvalues(bird.families,comm, reps=1000)

# Create random abundance weights
weights = runif(length(bird.families$tip.label))
names(weights) = bird.families$tip.label

#Use query function to calculate standardized versions under the sequential model
pd.pvalues(bird.families,comm,null.model="sequential",
           abundance.weights=weights, reps=1000)



