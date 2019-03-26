library(FactoClass)


### Name: stableclus
### Title: Stable clusters for cluster analysis
### Aliases: stableclus
### Keywords: multivariate cluster

### ** Examples

 data(ColorAdjective)
 FCcol <-FactoClass(ColorAdjective, dudi.coa,nf=6,nfcl=10,k.clust=7,scanFC = FALSE)
 acs <- FCcol$dudi
# stableclus(acs,3,3,4,TRUE,TRUE)




