library(PhyloMeasures)


### Name: cac.query
### Title: Computes the (standardized) value of the Core Ancestor Cost
###   measure
### Aliases: cac.query

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

#Create 100 random communities with 50 families each
comm = matrix(0,nrow = 100,ncol = length(bird.families$tip.label))
for(i in 1:nrow(comm)) {comm[i,sample(1:ncol(comm),50)] = 1}
colnames(comm) = bird.families$tip.label

#Calculate cac values for each community
cac.query(bird.families,comm,0.8)

#Calculate standardized versions under the uniform model
cac.query(bird.families,comm,0.8,TRUE)

# Create random abundance weights
weights = runif(length(bird.families$tip.label))
names(weights) = bird.families$tip.label

#Use query function to calculate standardized versions under the sequential model
cac.query(bird.families,comm,0.8,TRUE,null.model="sequential",
          abundance.weights=weights, reps=1000)



