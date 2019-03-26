library(adehabitatHS)


### Name: scatterniche
### Title: Display the Niche in the Ecological Space
### Aliases: scatterniche
### Keywords: hplot

### ** Examples

data(chamois)
cpi <- slot(count.points(chamois$locs, chamois$map),"data")[,1]
chamois$map

tab <- slot(chamois$map, "data")

## we focus on the distance to ecotone and on the slope,
## after centring and scaling (with the help of a PCA)
scatterniche(dudi.pca(tab[,2:3], scannf=FALSE)$tab, cpi)
scatterniche(dudi.pca(tab[,2:3], scannf=FALSE)$tab, cpi, pts=TRUE)




