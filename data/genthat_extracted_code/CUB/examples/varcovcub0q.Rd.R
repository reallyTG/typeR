library(CUB)


### Name: varcovcub0q
### Title: Variance-covariance matrix of CUB models with covariates for the
###   feeling component
### Aliases: varcovcub0q
### Keywords: internal

### ** Examples

data(univer)
m<-7
ordinal<-univer[,9]
pai<-0.86
gama<-c(-1.94, -0.17)
W<-univer[,4]           
varmat<-varcovcub0q(m, ordinal, W, pai, gama)



