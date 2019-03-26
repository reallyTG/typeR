library(MiRSEA)


### Name: EnrichmentScore2
### Title: Computes the enrichment score faster
### Aliases: EnrichmentScore2
### Keywords: file

### ** Examples

#Computes the enrichment score of a miRNA set in miRNA list
R2<-EnrichmentScore2(miR.list=sample(1:100),miR.set=c(39,28,37,38,11,3,34),
correl.vector=rep(0.04,100))
#show the result
R2$ES



