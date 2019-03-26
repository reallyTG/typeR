library(ChemometricsWithR)


### Name: AdjRkl
### Title: Adjusted Rand Index
### Aliases: AdjRkl
### Keywords: cluster

### ** Examples

if (require("kohonen")) {
  data(wines, package = "kohonen")
  wines.dist <- dist(scale(wines))
  wines.sl <- hclust(wines.dist, method = "single")
  wines.cl <- hclust(wines.dist, method = "complete")

  AdjRkl(cutree(wines.sl, 4), cutree(wines.cl, 4))
} else {
  cat("Package kohonen not available.\nInstall it by typing 'install.packages(\"kohonen\")'")
}



