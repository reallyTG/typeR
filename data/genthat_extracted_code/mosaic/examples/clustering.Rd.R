library(mosaic)


### Name: fortify.hclust
### Title: mosaic tools for clustering
### Aliases: fortify.hclust mplot.hclust

### ** Examples

KidsFeet %>% select(-name, -birthmonth) %>% rescale() -> KidsFeet2
  M <- dist(KidsFeet2)
  Cl <- hclust(M)
  fortify(Cl, k=5) %>% head(3)
  fortify(Cl, which="heatmap", data=KidsFeet2) %>% head(3)
  fortify(Cl, which="data", data=KidsFeet2) %>% head(3)
  fortify(Cl, which="labels") %>% head(3)
  mplot(Cl, data=KidsFeet2, k=4, heatmap=2)
  mplot(Cl, data=KidsFeet2, k=4, heatmap=0.5, enumerate="transparent")
  mplot(Cl, data=KidsFeet2, k=4, heatmap=2, type="triangle")
  mplot(Cl, data=KidsFeet2, k=4, heatmap=0, type="triangle")



