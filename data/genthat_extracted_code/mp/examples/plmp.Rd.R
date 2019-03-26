library(mp)


### Name: plmp
### Title: Part-Linear Multidimensional Projection
### Aliases: plmp

### ** Examples


# Iris example
emb <- plmp(iris[,1:4])
plot(emb, col=iris$Species)




