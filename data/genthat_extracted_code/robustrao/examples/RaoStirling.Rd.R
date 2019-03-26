library(robustrao)


### Name: RaoStirling
### Title: Rao-Stirling diversity index based on the counts of cited
###   disciplines.
### Aliases: RaoStirling

### ** Examples

#Load data
data(pubdata1)

#Get Rao-Stirling diversity index of all publications in the dataset
RaoStirling(pd1.count.matrix, pd1.similarity)

#Get Rao-Stirling diversity index of one publication of the dataset
RaoStirling(pd1.count.matrix[,2], pd1.similarity)




