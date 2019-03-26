library(MiRSEA)


### Name: EnrichmentScore
### Title: Computes the enrichment score
### Aliases: EnrichmentScore
### Keywords: file

### ** Examples

#Computes the enrichment score of a miRNA set in a ordered miRNA list.
E1<-EnrichmentScore(miR.list=sample(1:1000),miR.set=c(39,281,37,381,39,11,3,34),
correl.vector=rep(0.3,1000))
#show results
#EnrichmentScore of this set
E1$ES
#peak running enrichment
E1$arg.ES
#running enrichment score of top ten miRNAs
E1$RES[1:10]
#Binary vector indicating the location of top ten miRNA in the miRNA list
E1$tag.indicator[1:10]




