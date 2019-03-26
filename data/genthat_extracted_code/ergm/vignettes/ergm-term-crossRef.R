## ---- include=FALSE------------------------------------------------------
library(ergm)
termBlock<-ergm:::.extractTermBlock()
items<-ergm:::.extractTags(termBlock,"\\item")
terms<-lapply(items,ergm:::.extractTerms)
terms<-unlist(terms,recursive=FALSE)

## ------------------------------------------------------------------------
search.ergmTerms(keyword='triangle')

## ------------------------------------------------------------------------
search.ergmTerms(categories=c('bipartite','dyad-independent'))

## ----results='asis',echo=FALSE-------------------------------------------
ergm:::.termMatrix(terms,categories=c('binary', 'valued', 'directed', 'undirected', 'bipartite', 'dyad-independent'),only.include='frequently-used')

## ----results='asis',echo=FALSE-------------------------------------------
ergm:::.termMatrix(terms)

## ----results='asis',echo=FALSE-------------------------------------------
ergm:::.termTable(terms)

## ----results='asis',echo=FALSE-------------------------------------------
ergm:::.termToc(terms)

## ------------------------------------------------------------------------
sessionInfo()

