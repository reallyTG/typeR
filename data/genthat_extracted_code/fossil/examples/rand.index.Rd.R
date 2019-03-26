library(fossil)


### Name: rand.index
### Title: Rand Index and Adjusted Rand Index
### Aliases: rand.index adj.rand.index

### ** Examples

#create a hypothetical clustering outcome with 2 distinct clusters
g1 <- sample(1:2, size=10, replace=TRUE)
g2 <- sample(1:3, size=10, replace=TRUE)
rand.index(g1, g2)



