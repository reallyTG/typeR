library(cheddar)


### Name: PredationMatrix
### Title: Predation matrix
### Aliases: PredationMatrix
### Keywords: utilities

### ** Examples

data(TL84)

# A square matrix of NumberOfNodes rows and columns
dim(PredationMatrix(TL84))
NumberOfNodes(TL84)

# Should contain NumberOfTrophicLinks links
sum(PredationMatrix(TL84))
NumberOfTrophicLinks(TL84)

# Compare an unweighted matrix and a matrix weighted by diet fraction
data(Benguela)

PredationMatrix(Benguela)
PredationMatrix(Benguela, weight='diet.fraction')



