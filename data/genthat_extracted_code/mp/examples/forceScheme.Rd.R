library(mp)


### Name: forceScheme
### Title: Force Scheme Projection
### Aliases: forceScheme

### ** Examples

# Eurodist example
emb <- forceScheme(eurodist)
plot(emb, type = "n", xlab ="", ylab ="", asp=1, axes=FALSE, main="")
text(emb, labels(eurodist), cex = 0.6)

# Iris example
emb <- forceScheme(dist(iris[,1:4]))
plot(emb, col=iris$Species)



