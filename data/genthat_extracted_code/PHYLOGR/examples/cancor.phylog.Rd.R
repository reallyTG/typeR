library(PHYLOGR)


### Name: cancor.phylog
### Title: Canonical Correlation Analysis from Simulated Data Sets
### Aliases: cancor.phylog
### Keywords: multivariate

### ** Examples

data(SimulExample)
ex1.cancor <- cancor.phylog(SimulExample[,c(1,2,3,4,5)],SimulExample[,c(1,2,6,7,8)])
ex1.cancor
summary(ex1.cancor)
plot(ex1.cancor)



