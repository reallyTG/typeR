library(FactoMineR)


### Name: plot.PCA
### Title: Draw the Principal Component Analysis (PCA) graphs
### Aliases: plot.PCA
### Keywords: dplot

### ** Examples

data(decathlon)
res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup = 13)
plot(res.pca, habillage = 13, col.hab=c("green","blue"))
## To automatically draw ellipses around the barycentres of all the categorical variables
plotellipses(res.pca)
## Selection of some individuals
plot(res.pca,select="contrib 7") #plot the 7 individuals that have the highest cos2 
plot(res.pca,select="cos2 0.8")  #plot the individuals that have a cos2 greater than 0.8
plot(res.pca,select="cos2 5")     #plot the 5 individuals that have the highest cos2 
plot(res.pca,choix="var",select="cos2 0.6")  #plot the variables that have a cos2 greater than 0.6



