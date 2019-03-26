library(PhyloMeasures)


### Name: PhyloMeasures-package
### Title: PhyloMeasures: Fast Computations of Phylogenetic Biodiversity
###   Measures
### Aliases: PhyloMeasures-package PhyloMeasures
### Keywords: phylogeny biodiversity distance

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

#Create 100 random communities with 50 families each
comm = matrix(0,nrow = 100,ncol = length(bird.families$tip.label))
for(i in 1:nrow(comm)) {comm[i,sample(1:ncol(comm),50)] = 1}
colnames(comm) = bird.families$tip.label

#Use query function to calculate pd values for each community
pd.query(bird.families,comm)

#Use query function to calculate standardised versions under the uniform model
pd.query(bird.families,comm,TRUE)

# Create random abundance weights
weights = runif(length(bird.families$tip.label))
names(weights) = bird.families$tip.label

#Use query function to calculate standardized versions under the sequential model
pd.query(bird.families,comm,TRUE,null.model="sequential",
         abundance.weights=weights, reps=1000)




