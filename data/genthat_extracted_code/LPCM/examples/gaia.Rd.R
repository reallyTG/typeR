library(LPCM)


### Name: gaia
### Title: Gaia data
### Aliases: gaia
### Keywords: datasets

### ** Examples

data(gaia)
s <- sample(nrow(gaia),200)
library(lattice)
splom(gaia[s,5:20], cex=0.3,pscales=0)

gaia.pc <-  princomp(gaia[s,5:20])
temp <- gaia$temperature
tempcol     <- (temp[s]- min(temp[s]))/max(temp[s]- min(temp[s]))
library(scatterplot3d)
scatterplot3d(gaia.pc$scores[,c(2,1,3)], pch="+",
     color=rgb(sqrt(tempcol),0,1-sqrt(tempcol)))
     # This is a 3D scatterplot of the first three principal component scores;
     # with higher stellar temperatures shaded in red colour.



