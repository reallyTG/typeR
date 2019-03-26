library(robustrao)


### Name: PruneDisciplines
### Title: Set of permissible disciplines for redistribution.
### Aliases: PruneDisciplines

### ** Examples

#Load data
data(pubdata1)

#Get counts of citations of one of the publications in the dataset
counts <- pd1.count.matrix[,1]

#Get logical vector indicating which disciplines are referenced by the publication
logic.disciplines <- counts > 0

PruneDisciplines(logic.disciplines, 0.233, pd1.similarity)



