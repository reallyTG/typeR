library(BayesGOF)


### Name: gMLE.pg
### Title: Negative-Binomial Parameter Estimation
### Aliases: gMLE.pg

### ** Examples

### without exposure
data(ChildIll)
ill.start <- gMLE.pg(ChildIll)
ill.start
### with exposure
data(NorbergIns)
X <- NorbergIns$deaths
E <- NorbergIns$exposure/344
norb.start <- gMLE.pg(X, exposure = E)
norb.start



