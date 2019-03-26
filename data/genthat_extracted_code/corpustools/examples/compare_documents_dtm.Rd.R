library(corpustools)


### Name: compare_documents_dtm
### Title: Compare the documents in a dtm with a sliding window over time
### Aliases: compare_documents_dtm

### ** Examples

## Not run: 
##D data(dtm)
##D data(meta)
##D 
##D dtm = tm::weightTfIdf(dtm)
##D g = compare_documents_dtm(dtm, meta, hour_window = c(0.1, 36))
##D 
##D vcount(g) # number of documents, or vertices
##D ecount(g) # number of document pairs, or edges
##D 
##D head(igraph::get.data.frame(g, 'vertices'))
##D head(igraph::get.data.frame(g, 'edges'))
## End(Not run)



