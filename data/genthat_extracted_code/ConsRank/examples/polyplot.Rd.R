library(ConsRank)


### Name: polyplot
### Title: Plot rankings on a permutation polytope of 3 o 4 objects
###   containing all possible ties
### Aliases: polyplot
### Keywords: Permutation polytope

### ** Examples

polyplot()
#polyplot(nobj=4)
data(BU)
polyplot(BU[,1:3],Wk=BU[,4])




