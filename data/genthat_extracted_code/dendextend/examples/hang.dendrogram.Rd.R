library(dendextend)


### Name: hang.dendrogram
### Title: Hang dendrogram leaves
### Aliases: hang.dendrogram

### ** Examples


# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

par(mfrow = c(1,2))
plot(hang.dendrogram(dend))
plot(hc)
# identical(as.dendrogram(hc, hang = 0.1), hang.dendrogram(dend, hang = 0.1))
# TRUE!!


par(mfrow = c(1,4))

plot(dend)
plot(hang.dendrogram(dend, hang = 0.1))
plot(hang.dendrogram(dend, hang = 0))
plot(hang.dendrogram(dend, hang = -0.1))

par(mfrow = c(1,1))
plot(hang.dendrogram(dend), horiz = TRUE)
 
 



