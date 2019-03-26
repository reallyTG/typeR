library(useful)


### Name: fortify.kmeans
### Title: fortify.kmeans
### Aliases: fortify.kmeans

### ** Examples


k1 <- kmeans(x=iris[, 1:4], centers=3)
hold <- fortify(k1, data=iris)
head(hold)
hold2 <- fortify(k1)
head(hold2)




