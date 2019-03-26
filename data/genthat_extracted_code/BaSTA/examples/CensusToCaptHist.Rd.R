library(BaSTA)


### Name: CensusToCaptHist
### Title: Constructs capture-history matrix from census matrix to be used
###   in Bayesian Survival Trajectory Analysis (BaSTA).
### Aliases: CensusToCaptHist

### ** Examples

id.vec <- sort(sample(1:5, size = 15, replace = TRUE))
d.vec <- rep(0, length(id.vec))
for(i in unique(id.vec)){
  svec <- which(id.vec == i)
  d.vec[svec] <- sort(sample(1990:1995, length(svec)))
}
Y <- CensusToCaptHist(ID = id.vec,  d = d.vec)



