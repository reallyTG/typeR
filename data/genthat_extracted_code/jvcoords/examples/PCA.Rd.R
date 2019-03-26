library(jvcoords)


### Name: PCA
### Title: Perform Principal Component Analysis (PCA)
### Aliases: PCA

### ** Examples

  pc <- PCA(iris[, 1:4], scale = TRUE, n.comp = 2)
  pc
  plot(pc$y, col=iris$Species)



