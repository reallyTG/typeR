library(adehabitatHS)


### Name: scatter.enfa
### Title: Scatter Plot of the Results of the ENFA
### Aliases: scatter.enfa
### Keywords: multivariate hplot

### ** Examples

data(lynxjura)

map <- lynxjura$map

## We keep only "wild" indices.
locs <- lynxjura$locs
locs <- locs[slot(locs, "data")[,2]!="D",]

hist(map, type = "l")
## The variable artif is far from symetric

## We perform a square root transformation
## of this variable
## We therefore normalize the variable 'artif'
slot(map,"data")[,4] <- sqrt(slot(map,"data")[,4])
hist(map, type = "l")

## We prepare the data for the ENFA
tab <- slot(map, "data")
pr <- slot(count.points(locs, map), "data")[,1]


## We then perform the PCA before the ENFA
pc <- dudi.pca(tab, scannf = FALSE)

## We perform the ENFA
(enfa1 <- enfa(pc, pr, scannf = FALSE))

scatter(enfa1)





