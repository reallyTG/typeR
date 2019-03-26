library(tmod)


### Name: tmodPCA
### Title: PCA plot annotated with tmod
### Aliases: tmodPCA

### ** Examples

data(Egambia)
E <- as.matrix(Egambia[,-c(1:3)])
pca <- prcomp(t(E), scale.=TRUE)
group <- rep(c("CTRL", "TB"), each=15)
tmodPCA(pca, 
  genes=Egambia$GENE_SYMBOL, 
  components=4:3,
  plot.params=list(group=group))



