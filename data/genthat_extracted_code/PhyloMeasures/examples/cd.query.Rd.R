library(PhyloMeasures)


### Name: cd.query
### Title: Computes the (standardized) value of the Community Distance
###   measure
### Aliases: cd.query

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

#Create 10 random communities with 50 families each
comm = matrix(0,nrow = 10,ncol = length(bird.families$tip.label))
for(i in 1:nrow(comm)) {comm[i,sample(1:ncol(comm),50)] = 1}
colnames(comm) = bird.families$tip.label

#Calculate all pairwise CD values for communities in comm
cd.query(bird.families,comm)

#Calculate pairwise distances from 
#the first two rows of comm to all rows
cd.query(bird.families, comm[1:2,],comm)

#Calculate the distances from the first two rows 
#to all rows using the query matrix
qm = expand.grid(1:2,1:10)
cd.query(bird.families,comm,query.matrix = qm) 

#Calculate standardized versions
cd.query(bird.families,comm,standardize = TRUE)    



