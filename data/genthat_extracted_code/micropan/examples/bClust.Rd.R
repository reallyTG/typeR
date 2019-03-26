library(micropan)


### Name: bClust
### Title: Clustering sequences based on pairwise distances
### Aliases: bClust

### ** Examples

# Loading distance data in the micropan package
data(Mpneumoniae.blast.distances,package="micropan")

# Clustering with default settings
clustering.blast.single <- bClust(Mpneumoniae.blast.distances)

# Clustering with complete linkage and a liberal threshold
clustering.blast.complete <- bClust(Mpneumoniae.blast.distances,linkage="complete",threshold=0.75)




