library(splancs)


### Name: nndistG
### Title: Nearest neighbour distances as used by Ghat()
### Aliases: nndistG
### Keywords: spatial

### ** Examples

data(uganda)
boxplot(nndistG(as.points(uganda))$dists)
plot(ecdf(nndistG(as.points(uganda))$dists))



