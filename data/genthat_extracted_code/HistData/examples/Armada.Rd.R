library(HistData)


### Name: Armada
### Title: La Felicisima Armada
### Aliases: Armada
### Keywords: datasets

### ** Examples

data(Armada)
# delete character and redundant variable
armada <- Armada[,-c(1,6)]

armada.pca <- prcomp(armada, scale.=TRUE)
summary(armada.pca)

plot(armada.pca, type="lines", pch=16, cex=2)
biplot(armada.pca)



