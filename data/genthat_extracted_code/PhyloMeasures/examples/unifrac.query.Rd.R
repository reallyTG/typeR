library(PhyloMeasures)


### Name: unifrac.query
### Title: Computes the value of the Unique Fraction measure
### Aliases: unifrac.query

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

#Create 10 random communities with 50 families each
comm = matrix(0,nrow = 10,ncol = length(bird.families$tip.label))
for(i in 1:nrow(comm)) {comm[i,sample(1:ncol(comm),50)] = 1}
colnames(comm) = bird.families$tip.label

#Calculate all pairwise UniFrac values for communities in comm
unifrac.query(bird.families,comm)

#Calculate pairwise distances from 
#the first two rows of comm to all rows
unifrac.query(bird.families, comm[1:2,],comm)

#Calculate the distances from the first two rows 
#to all rows using the query matrix
qm = expand.grid(1:2,1:10)
unifrac.query(bird.families,comm,query.matrix = qm)     



