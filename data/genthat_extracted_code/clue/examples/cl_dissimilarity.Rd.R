library(clue)


### Name: cl_dissimilarity
### Title: Dissimilarity Between Partitions or Hierarchies
### Aliases: cl_dissimilarity
### Keywords: cluster

### ** Examples

## An ensemble of partitions.
data("CKME")
pens <- CKME[1 : 30]
diss <- cl_dissimilarity(pens)
summary(c(diss))
cl_dissimilarity(pens[1:5], pens[6:7])
## Equivalently, using subscripting.
diss[1:5, 6:7]
## Can use the dissimilarities for "secondary" clustering
## (e.g. obtaining hierarchies of partitions):
hc <- hclust(diss)
plot(hc)

## Example from Boorman and Arabie (1972).
P1 <- as.cl_partition(c(1, 2, 2, 2, 3, 3, 2, 2))
P2 <- as.cl_partition(c(1, 1, 2, 2, 3, 3, 4, 4))
cl_dissimilarity(P1, P2, "BA/A")
cl_dissimilarity(P1, P2, "BA/C")

## Hierarchical clustering.
d <- dist(USArrests)
x <- hclust(d)
cl_dissimilarity(x, d, "cophenetic")
cl_dissimilarity(x, d, "gamma")



