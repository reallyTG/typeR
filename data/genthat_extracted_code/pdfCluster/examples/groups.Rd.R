library(pdfCluster)


### Name: groups
### Title: Extracts groups
### Aliases: groups
### Keywords: cluster

### ** Examples

# load data
data(wine)

# select a subset of variables
x <- wine[, c(2, 5, 8)]

#clustering
cl <- pdfCluster(x)

groups(cl)

#equivalent to:
cl@clusters

#to extract the cluster cores
groups(cl, stage = 0)



