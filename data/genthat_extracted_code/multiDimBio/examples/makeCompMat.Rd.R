library(multiDimBio)


### Name: makeCompMat
### Title: A function to create a pairwise comparison matrix
### Aliases: makeCompMat

### ** Examples

makeCompMat(3)

makeCompMat(4)

data(Groups)
NGroups<-length(unique(Groups))

makeCompMat(NGroups)



