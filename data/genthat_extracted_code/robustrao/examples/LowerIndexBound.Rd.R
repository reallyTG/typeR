library(robustrao)


### Name: LowerIndexBound
### Title: Lower bound of the uncertainty interval of the Rao-Stirling
###   diversity index.
### Aliases: LowerIndexBound

### ** Examples

##EXAMPLE 1
#Load data
data(pubdata1)

#Get counts of citations of one of the publications in the dataset
counts <- pd1.count.matrix[,1]

#Get number of uncategorized references in the publication
uncat <- pd1.uncat.refs[1]

#Get vector of permissible disciplines.
logic.disciplines <- counts > 0
permissible <- PruneDisciplines(logic.disciplines, 0.233, pd1.similarity)

LowerIndexBound(counts, uncat, pd1.similarity, permissible)




