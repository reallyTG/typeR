library(sets)


### Name: fuzzydocs
### Title: Documents on Fuzzy Theory
### Aliases: fuzzy_docs
### Keywords: datasets

### ** Examples

data(fuzzy_docs)

## compute distance matrix using Jaccard dissimilarity
d <- as.dist(set_outer(fuzzy_docs, gset_dissimilarity))

## apply hierarchical clustering (Ward method)
cl <- hclust(d, "ward")

## retrieve two clusters
cutree(cl, 2)

## -> clearly, the clusters are formed by docs 1--12 and 13--30,
## respectively.




