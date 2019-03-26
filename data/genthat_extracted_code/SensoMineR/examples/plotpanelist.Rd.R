library(SensoMineR)


### Name: plotpanelist
### Title: Plotpanelist
### Aliases: plotpanelist
### Keywords: multivariate

### ** Examples

data(chocolates)
donnee <- cbind.data.frame(sensochoc[,c(1,4,5:18)])
axe <- construct.axes(donnee, scale.unit = TRUE)
plotpanelist(axe$moyen, eig = signif(axe$eig,4))



