library(NCmisc)


### Name: sim.cor
### Title: Simulate a dataset with correlated measures
### Aliases: sim.cor

### ** Examples

corDat <- sim.cor(200,5)
prv(corDat) # preview of simulated normal data with r uniformly varying
cor(corDat) # correlation matrix
corDat <- sim.cor(500,4,genx=runif,genr=function(x) { 0.5 },mix.order=FALSE)
prv(corDat) # preview of simulated uniform data with r fixed at 0.5
cor(corDat) # correlation matrix



