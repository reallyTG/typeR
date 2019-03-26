library(adiv)


### Name: birdData
### Title: Avian Communities along Successional Forest Gradients
### Aliases: birdData
### Keywords: datasets

### ** Examples

data(birdData)
phy <- read.tree(text=birdData$tre)
phydis <- sqrt(distTips(phy, method="nNodes")+1)

fau <- birdData$fau[, phy$tip.label]
facA <- birdData$facA
facB <- birdData$facB

cd_mainB <- crossdpcoa_maineffect(fau, facB, facA, phydis, w=rep(1/30, 30), scannf = FALSE)
s.label(cd_mainB$l2)



