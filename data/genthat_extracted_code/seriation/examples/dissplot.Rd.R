library(seriation)


### Name: dissplot
### Title: Dissimilarity Plot
### Aliases: dissplot plot.reordered_cluster_dissimilarity_matrix
###   print.reordered_cluster_dissimilarity_matrix
### Keywords: hplot cluster

### ** Examples

data("iris")
d <- dist(iris[-5])

## plot original matrix
res <- dissplot(d, method = NA)

## plot reordered matrix using the nearest insertion algorithm (from tsp)
res <- dissplot(d, method = "TSP",
    options = list(main = "Seriation (TSP)"))

## cluster with pam (we know iris has 3 clusters)
library("cluster")
l <- pam(d, 3, cluster.only = TRUE)

## we use a grid layout to place several plots on a page
library("grid")
grid.newpage()
pushViewport(viewport(layout=grid.layout(nrow = 2, ncol = 2),
    gp = gpar(fontsize = 8)))
pushViewport(viewport(layout.pos.row = 1, layout.pos.col = 1))

## visualize the clustering (using Spectral between clusters and MDS within)
res <- dissplot(d, l, method = list(inter = "Spectral", intra = "MDS"),
    options = list(main = "PAM + Seriation - standard",
    newpage = FALSE))

popViewport()
pushViewport(viewport(layout.pos.row = 1, layout.pos.col = 2))

## more visualization options. Note that we reuse the reordered object res!
## color: use 10 shades red-blue
plot(res, options = list(main = "PAM + Seriation",
    col= bluered(10, bias=.5), newpage = FALSE))

popViewport()
pushViewport(viewport(layout.pos.row = 2, layout.pos.col = 1))

## threshold (using zlim) and cubic scale to highlight differences
plot(res, options = list(main = "PAM + Seriation - threshold",
    zlim = c(0, 1.5), col = greys(100, power = 2), newpage = FALSE))

popViewport()
pushViewport(viewport(layout.pos.row = 2, layout.pos.col = 2))

## use custom (logistic) scale
plot(res, options = list(main = "PAM + Seriation - logistic scale",
    col= hcl(c = 0, l = (plogis(seq(10, 0, length=100),
	location = 2, scale = 1/2, log = FALSE))*100),
	newpage = FALSE))

popViewport(2)

## the reordered_cluster_dissimilarity_matrix object
res
names(res)



