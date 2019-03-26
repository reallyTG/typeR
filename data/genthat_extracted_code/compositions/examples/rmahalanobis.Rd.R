library(compositions)


### Name: rMahalanobis
### Title: Compute distributions of empirical Mahalanobis distances based
###   on simulations
### Aliases: pMaxMahalanobis qMaxMahalanobis rMaxMahalanobis
###   pEmpiricalMahalanobis qEmpiricalMahalanobis rEmpiricalMahalanobis
###   pPortionMahalanobis qPortionMahalanobis rPortionMahalanobis
###   pQuantileMahalanobis gsi.pStore
### Keywords: distribution

### ** Examples

rEmpiricalMahalanobis(10,25,2,sorted=TRUE,pow=1,robust=TRUE)
pEmpiricalMahalanobis(qchisq(0.95,df=10),11,1,pow=2,replicates=1000)
(xx<-pMaxMahalanobis(qchisq(0.95,df=10),11,1,pow=2))
qEmpiricalMahalanobis(0.95,11,2)
rMaxMahalanobis(10,25,4)
qMaxMahalanobis(xx,11,1)



