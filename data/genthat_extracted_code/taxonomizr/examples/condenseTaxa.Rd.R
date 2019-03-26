library(taxonomizr)


### Name: condenseTaxa
### Title: Condense multiple taxonomic assignments to their most recent
###   common branch
### Aliases: condenseTaxa

### ** Examples

taxas<-matrix(c(
 'a','b','c','e',
 'a','b','d','e'
),nrow=2,byrow=TRUE)
condenseTaxa(taxas)
condenseTaxa(taxas[c(1,2,2),],c(1,1,2))



