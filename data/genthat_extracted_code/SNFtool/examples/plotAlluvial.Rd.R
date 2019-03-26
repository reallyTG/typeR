library(SNFtool)


### Name: plotAlluvial
### Title: Plot Alluvial
### Aliases: plotAlluvial

### ** Examples

K <- 20
alpha <- 0.5
iter <- 20

data(Data1)
data(Data2)

dist1 <- (dist2(as.matrix(Data1), as.matrix(Data1)))^(1/2)
dist2 <- (dist2(as.matrix(Data2), as.matrix(Data2)))^(1/2)

W1 <- affinityMatrix(dist1, K, alpha)
W2 <- affinityMatrix(dist2, K, alpha)

W <- SNF(list(W1, W2), K, iter)

#Plots the alluvial with no colouring
plotAlluvial(W, 2:5)

#Change the colour of all samples a single colour
plotAlluvial(W, 2:5, col="red")

colour.breaks <- 30
#This will assign each sample to one of colour.breaks colour bins between green and red.
colFunc <- colorRampPalette(c("green", "red"))
colours <- colFunc(colour.breaks)[as.numeric(cut(Data1[,1],breaks=colour.breaks))]
plotAlluvial(W, 2:5, col=colours)



