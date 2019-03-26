library(vegan)


### Name: stepacross
### Title: Stepacross as Flexible Shortest Paths or Extended
###   Dissimilarities
### Aliases: stepacross
### Keywords: multivariate

### ** Examples

# There are no data sets with high beta diversity in vegan, but this
# should give an idea.
data(dune)
dis <- vegdist(dune)
edis <- stepacross(dis)
plot(edis, dis, xlab = "Shortest path", ylab = "Original")
## Manhattan distance have no fixed upper limit.
dis <- vegdist(dune, "manhattan")
is.na(dis) <- no.shared(dune)
dis <- stepacross(dis, toolong=0)



