library(dbscan)


### Name: hdbscan
### Title: HDBSCAN
### Aliases: hdbscan HDBSCAN print.hdbscan plot.hdbscan
### Keywords: model clustering hierarchical

### ** Examples

## cluster the moons data set with HDBSCAN
data(moons)

res <- hdbscan(moons, minPts = 5)
res

plot(res)

plot(moons, col = res$cluster + 1L)

## DS3 from Chameleon
data("DS3")

res <- hdbscan(DS3, minPts = 50)
res

## Plot the simplified tree, highlight the most stable clusters
plot(res, show_flat = TRUE)

## Plot the actual clusters
plot(DS3, col=res$cluster+1L, cex = .5)



