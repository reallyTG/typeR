library(adehabitatHS)


### Name: eisera
### Title: Eigenanalysis of Selection Ratios
### Aliases: eisera print.esr scatter.esr
### Keywords: multivariate hplot

### ** Examples


###########################################################
###########################################################
###
###  Example given in Calenge and Dufour 2006 (design II)


data(squirrel)

## computation of the number of relocations in each habitat type
## from the data given by Aebischer et al. (1993).
## squirrel$locs give the percentage of relocations in each habitat
## type, and Aebischer et al. (1993) indicate that there are 30
## relocations per animal.
## We therefore compute the number of relocations in each habitat type
## using:
us <- round(30 * squirrel$locs / 100)

## Habitat availability 
av <- squirrel$studyarea

## Eigenanalysis of selection ratios
ii <- eisera(us, av, scannf = FALSE)

scatter(ii, grid = FALSE, clab = 0.7)


## The following graph may help the interpretation
## (see Calenge and Dufour 2006)
data(squirreloc)
locs <- squirreloc$locs
are <- squirreloc$map

ind <- levels(slot(locs, "data")$id)
opar <- par(mfrow=n2mfrow(length(ind)), mar=c(0,0,2,0))

tmp <- lapply(1:length(ind), function(i) {
     plot(are, col = as.data.frame(are)[,2])
     title(main = ind[i])
     points(locs[slot(locs, "data")[,1]==ind[i],], pch=16, cex=1.5)
box()
})
plot(0,0, axes=FALSE, ty="n", xlim=c(-1,1), asp=1)
legend(-0.8,0.8, unique(slot(are,"data")[,1]),
       fill=unique(slot(are,"data")[,2]))
par(opar)


###########################################################
###########################################################
###
###  Example of design III

iii <- eisera(us, squirrel$mcp, scannf = FALSE)
scatter(iii, grid = FALSE, clab = 0.7)




