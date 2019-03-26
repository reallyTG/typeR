library(PhyloMeasures)


### Name: cdnt.query
### Title: Computes the value of the maximised Community Distance Nearest
###   Taxon measure
### Aliases: cdnt.query

### ** Examples

#Load phylogenetic tree of bird families from package "ape"
data(bird.families, package = "ape")

#Create 10 random communities with 50 families each
comm = matrix(0,nrow = 10,ncol = length(bird.families$tip.label))
for(i in 1:nrow(comm)) {comm[i,sample(1:ncol(comm),50)] = 1}
colnames(comm) = bird.families$tip.label

#Calculate all pairwise mCDNT values for communities in comm
cdnt.query(bird.families,comm)

#Calculate pairwise distances from 
#the first two rows of comm to all rows
cdnt.query(bird.families, comm[1:2,],comm)

#Calculate the distances from the first two rows 
#to all rows using the query matrix
qm = expand.grid(1:2,1:10)
cdnt.query(bird.families,comm,query.matrix = qm)



