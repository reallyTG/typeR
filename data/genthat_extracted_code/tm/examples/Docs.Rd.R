library(tm)


### Name: Docs
### Title: Access Document IDs and Terms
### Aliases: Docs nDocs nTerms Terms

### ** Examples

data("crude")
tdm <- TermDocumentMatrix(crude)[1:10,1:20]
Docs(tdm)
nDocs(tdm)
nTerms(tdm)
Terms(tdm)



