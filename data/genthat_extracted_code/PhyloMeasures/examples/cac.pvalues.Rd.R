library(PhyloMeasures)


### Name: cac.pvalues
### Title: Computes the p-values of the Core Ancestor Cost measure
### Aliases: cac.pvalues

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

#Create 100 random communities with 50 families each
comm = matrix(0,nrow = 100,ncol = length(bird.families$tip.label))
for(i in 1:nrow(comm)) {comm[i,sample(1:ncol(comm),50)] = 1}
colnames(comm) = bird.families$tip.label

chi=0.6

#Calculate p-values under the uniform model
cac.pvalues(bird.families,comm,chi, reps=1000)

# Create random abundance weights
weights = runif(length(bird.families$tip.label))
names(weights) = bird.families$tip.label

# Calculate p-values under the sequential model
cac.pvalues(bird.families,comm,chi,null.model="sequential",
            abundance.weights=weights, reps=1000)



