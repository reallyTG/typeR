library(micropan)


### Name: geneWeights
### Title: Gene cluster weighting
### Aliases: geneWeights

### ** Examples

# Loading a Panmat object in the micropan package
data(list="Mpneumoniae.blast.panmat",package="micropan")

# Weighted Manhattan distances based on a BLAST clustering Panmat object
w <- geneWeights(Mpneumoniae.blast.panmat,type="shell")
Mdist.blast <- distManhattan(Mpneumoniae.blast.panmat,weights=w)




