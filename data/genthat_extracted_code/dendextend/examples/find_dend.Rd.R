library(dendextend)


### Name: dend_expend
### Title: Finds a "good" dendrogram for a dist
### Aliases: dend_expend find_dend

### ** Examples


x <- datasets::mtcars
out <- dend_expend(x, dist_methods = c("euclidean", "manhattan"))
out$performance

dend_expend(dist(x))$performance

best_dend <- find_dend(x, dist_methods = c("euclidean", "manhattan"))
plot(best_dend)





