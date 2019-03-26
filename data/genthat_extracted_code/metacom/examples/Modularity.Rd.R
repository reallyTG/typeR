library(metacom)


### Name: Modularity
### Title: Calculates Barber's Bipartite Modularity
### Aliases: Modularity

### ** Examples


#define an interaction matrix
data(TestMatrices)
intmat <- TestMatrices[[3]]

#determine Barber"s modularity
mod.intmat <- Modularity(intmat, method="r1", sims=5,
 scores=1, order=TRUE, nstarts=10)

#return results
mod.intmat




