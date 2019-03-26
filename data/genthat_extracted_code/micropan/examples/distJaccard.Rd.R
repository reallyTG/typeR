library(micropan)


### Name: distJaccard
### Title: Computing Jaccard distances between genomes
### Aliases: distJaccard

### ** Examples

# Loading two Panmat objects in the micropan package
data(list=c("Mpneumoniae.blast.panmat","Mpneumoniae.domain.panmat"),package="micropan")

# Jaccard distances based on a BLAST clustering Panmat object
Jdist.blast <- distJaccard(Mpneumoniae.blast.panmat)

# Jaccard distances based on domain sequence clustering Panmat object
Jdist.domains <- distJaccard(Mpneumoniae.domain.panmat) 




