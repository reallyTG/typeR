library(annotate)


### Name: entrezGeneQuery
### Title: Create a Query String for Entrez Genes
### Aliases: entrezGeneQuery
### Keywords: interface

### ** Examples

  q1<-entrezGeneQuery(c("leukemia", "Homo sapiens"))
  q1
  if( interactive())
    browseURL(q1[1])




