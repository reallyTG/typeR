library(adiv)


### Name: crossdpcoa
### Title: Crossed-DPCoA
### Aliases: crossdpcoa_maineffect crossdpcoa_version1 crossdpcoa_version2
### Keywords: models

### ** Examples

data(birdData)
phy <- read.tree(text=birdData$tre)
phydis <- sqrt(distTips(phy, method="nNodes")+1)

fau <- birdData$fau[, phy$tip.label]
facA <- birdData$facA
facB <- birdData$facB

#Here factor B is put first to analyze 
#the main effect of the strata:
cd_mainB <- crossdpcoa_maineffect(fau, facB, facA, phydis, w=rep(1/30, 30), scannf = FALSE)
barplot(cd_mainB$eig)
cd_mainB$eig[1:2]/sum(cd_mainB$eig)

#Positions of the levels of factor B on its principal axes:
s.label(cd_mainB$l2)
# The "d" value on graphs indicates the length of the edge of a grid cell (scale of the graphic). 

#The coordinates of the species on the same axes 
#can be displayed in front of the phylogeny:
mainBl1.4d <- phylo4d(phy, as.matrix(cd_mainB$l1))
parmar <- par()$mar
par(mar=rep(.1,4))
table.phylo4d(mainBl1.4d, show.node=FALSE, symbol="squares", center=FALSE, scale=FALSE)
par(mar=parmar)

#If factor A is put first, the analysis focus 
#on the main effect of the region:
cd_mainA <- crossdpcoa_maineffect(fau, facA, facB, phydis, w=rep(1/30, 30), scannf = FALSE)
barplot(cd_mainA$eig)
cd_mainA$eig[1:2]/sum(cd_mainA$eig)

#Positions of the levels of factor A on its principal axes:
s.label(cd_mainA$l2)
# The "d" value on graphs indicates the length of the edge of a grid cell (scale of the graphic). 

#The coordinates of the species on the same axes 
# can be displayed in front of the phylogeny:
mainAl1.4d <- phylo4d(phy, as.matrix(cd_mainA$l1))
parmar <- par()$mar
par(mar=rep(.1,4))
table.phylo4d(mainAl1.4d, show.node=FALSE, symbol="squares", center=FALSE, scale=FALSE)
par(mar=parmar)

#Crossed DPCoA Version 1
cd_v1 <- crossdpcoa_version1(fau, facA, facB, phydis, w=rep(1/30, 30), scannf = FALSE)
#Proportion of SS(A) expressed by the two first axes:
cd_v1$eig[1:2]/sum(cd_v1$eig)
#To view the positions of the locations on the first two axes, write:
s.label(cd_v1$l2)
#To view the positions of all communities on the first two axes, write:
s.label(cd_v1$l3)
#To view the positions of the species on the first two axes in front of the phylogeny, write:
v1l1.4d <- phylo4d(phy, as.matrix(cd_v1$l1))
parmar <- par()$mar
par(mar=rep(.1,4))
table.phylo4d(v1l1.4d, show.node=FALSE, symbol="squares", center=FALSE, scale=FALSE)
par(mar=parmar)

#Crossed DPCoA Version 2
#Crossed DPCoA version 2 can now be performed as follows:
cd_v2 <- crossdpcoa_version2(fau, facA, facB, phydis, w=rep(1/30, 30), scannf = FALSE)
#Proportion of variation among levels of factor A 
#in the subspace orthogonal to the principal axes of B
#expressed by the two first axes:
cd_v2$eig[1:2]/sum(cd_v2$eig)
#To view the positions of the locations on the first two axes, write:
s.label(cd_v2$l2)
#To view the positions of all communities on the first two axes, write:
s.label(cd_v2$l3)
#To view the positions of the species on the first two axes in front of the phylogeny, write:
v2l1.4d <- phylo4d(phy, as.matrix(cd_v2$l1))
parmar <- par()$mar
par(mar=rep(.1,4))
table.phylo4d(v2l1.4d, show.node=FALSE, symbol="squares", center=FALSE, scale=FALSE)
par(mar=parmar)



