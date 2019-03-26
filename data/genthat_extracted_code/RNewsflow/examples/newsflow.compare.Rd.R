library(RNewsflow)


### Name: newsflow.compare
### Title: Compare the documents in a dtm with a sliding window over time
### Aliases: newsflow.compare

### ** Examples

data(dtm)
data(meta)

dtm = tm::weightTfIdf(dtm)
g = newsflow.compare(dtm, meta, hour.window = c(0.1, 36))

vcount(g) # number of documents, or vertices
ecount(g) # number of document pairs, or edges

head(igraph::get.data.frame(g, 'vertices'))
head(igraph::get.data.frame(g, 'edges'))



