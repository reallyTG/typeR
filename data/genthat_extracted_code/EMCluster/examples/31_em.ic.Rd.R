library(EMCluster)


### Name: Information Criteria
### Title: Information Criteria for Model-Based Clustering
### Aliases: em.ic em.aic em.bic em.clc em.icl em.icl.bic
### Keywords: tool

### ** Examples

library(EMCluster, quietly = TRUE)
x2 <- da2$da

emobj <- list(pi = da2$pi, Mu = da2$Mu, LTSigma = da2$LTSigma)
em.ic(x2, emobj = emobj)



