library(micropan)


### Name: panMatrix
### Title: Computing the pan-matrix for a set of gene clusters
### Aliases: panMatrix

### ** Examples

# Loading clustering data in the micropan package
data(list=c("Mpneumoniae.blast.clustering","Mpneumoniae.domain.clustering"),package="micropan")

# Pan-matrix based on BLAST clustering
panmat.blast <- panMatrix(Mpneumoniae.blast.clustering)

# Pan-matrix based on domain sequence clustering
panmat.domains <- panMatrix(Mpneumoniae.domain.clustering)

# Plotting the first pan-matrix, and then printing its summary
plot(panmat.blast)
summary(panmat.blast)




