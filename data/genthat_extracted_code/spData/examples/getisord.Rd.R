library(spData)


### Name: getisord
### Title: Getis-Ord remote sensing example data
### Aliases: getisord x y xyz
### Keywords: datasets misc

### ** Examples

data(getisord)
image(x, y, t(matrix(xyz$val, nrow=16, ncol=16, byrow=TRUE)), asp=1)
text(xyz$x, xyz$y, xyz$val, cex=0.7)
polygon(c(195,225,225,195), c(195,195,225,225), lwd=2)
title(main="Getis-Ord 1996 remote sensing data")




