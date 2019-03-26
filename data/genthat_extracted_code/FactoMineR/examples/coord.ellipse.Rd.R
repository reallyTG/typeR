library(FactoMineR)


### Name: coord.ellipse
### Title: Construct confidence ellipses
### Aliases: coord.ellipse
### Keywords: dplot

### ** Examples

data(decathlon)
res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup = 13,graph=FALSE)
aa <- cbind.data.frame(decathlon[,13],res.pca$ind$coord)
bb <- coord.ellipse(aa,bary=TRUE)
plot(res.pca,habillage=13,ellipse=bb)

## To automatically draw ellipses around the barycentres of all the categorical variables
plotellipses(res.pca)



