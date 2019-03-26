library(pdfCluster)


### Name: adj.rand.index
### Title: Adjusted Rand index
### Aliases: adj.rand.index
### Keywords: cluster

### ** Examples

# load data
data(wine)
#actual groups
gr <- wine[, 1]

# select a subset of variables
x <- wine[, c(2, 5, 8)]

#clustering
cl <- pdfCluster(x)

#comparison with original groups
table(groups(cl), gr)
adj.rand.index(groups(cl), gr)



