library(dbscan)


### Name: reachability
### Title: Density Reachability Structures
### Aliases: reachability as.reachability as.reachability.optics
###   as.reachability.dendrogram as.dendrogram as.dendrogram.reachability
###   plot.reachability print.reachability
### Keywords: model clustering hierarchical clustering

### ** Examples

set.seed(2)
n <- 20

x <- cbind(
  x = runif(4, 0, 1) + rnorm(n, sd=0.1),
  y = runif(4, 0, 1) + rnorm(n, sd=0.1)
)

plot(x, xlim=range(x), ylim=c(min(x)-sd(x), max(x)+sd(x)), pch=20)
text(x = x, labels = 1:nrow(x), pos=3)

### run OPTICS
res <- optics(x, eps = 10,  minPts = 2)
res

### plot produces a reachability plot
plot(res)

### Extract reachability components from OPTICS
reach <- as.reachability(res)
reach

### plot still produces a reachability plot; points ids
### (rows in the original data) can be displayed with order_labels = TRUE
plot(reach, order_labels = TRUE)

### Reachability objects can be directly converted to dendrograms
dend <- as.dendrogram(reach)
dend
plot(dend)

### A dendrogram can be converted back into a reachability object
plot(as.reachability(dend))





