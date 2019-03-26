library(dendextend)


### Name: color_unique_labels
### Title: Color unique labels in a dendrogram
### Aliases: color_unique_labels

### ** Examples


x <- c(2011,2011,2012,2012,2015,2015,2015)
names(x) <- x
dend <- as.dendrogram(hclust(dist(x)))

par(mfrow = c(1,2))
plot(dend)
dend2 <- color_unique_labels(dend)
plot(dend2)



