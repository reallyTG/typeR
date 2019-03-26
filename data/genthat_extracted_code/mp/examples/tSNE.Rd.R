library(mp)


### Name: tSNE
### Title: t-Distributed Stochastic Neighbor Embedding
### Aliases: tSNE

### ** Examples

# Iris example
emb <- tSNE(iris[, 1:4])
plot(emb, col=iris$Species)




