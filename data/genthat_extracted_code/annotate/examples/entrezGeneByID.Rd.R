library(annotate)


### Name: entrezGeneByID
### Title: Create a Query String for an Entrez Gene Identifier
### Aliases: entrezGeneByID
### Keywords: interface

### ** Examples

  q1<-entrezGeneByID(c("100", "1002"))
  q1
  if( interactive())
    browseURL(q1[1])




