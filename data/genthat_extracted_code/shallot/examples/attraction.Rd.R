library(shallot)


### Name: attraction
### Title: Attraction
### Aliases: attraction print.shallot.attraction
###   as.matrix.shallot.attraction

### ** Examples

permutation <- permutation(n.items=50,fixed=FALSE)
decay <- decay.exponential(temperature(1.0),dist(scale(USArrests)))
attraction(permutation, decay)



