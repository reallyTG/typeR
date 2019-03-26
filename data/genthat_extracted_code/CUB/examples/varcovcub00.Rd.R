library(CUB)


### Name: varcovcub00
### Title: Variance-covariance matrix of a CUB model without covariates
### Aliases: varcovcub00
### Keywords: internal

### ** Examples

data(univer)
m<-7
ordinal<-univer[,12]
pai<-0.87
csi<-0.17
varmat<-varcovcub00(m, ordinal, pai, csi)



