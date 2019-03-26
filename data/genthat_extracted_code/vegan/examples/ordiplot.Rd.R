library(vegan)


### Name: ordiplot
### Title: Alternative plot and identify Functions for Ordination
### Aliases: ordiplot identify.ordiplot scores.ordiplot points.ordiplot
###   text.ordiplot
### Keywords: hplot iplot aplot

### ** Examples

# Draw a plot for a non-vegan ordination (cmdscale).
data(dune)
dune.dis <- vegdist(wisconsin(dune))
dune.mds <- cmdscale(dune.dis, eig = TRUE)
dune.mds$species <- wascores(dune.mds$points, dune, expand = TRUE)
pl <- ordiplot(dune.mds, type = "none")
points(pl, "sites", pch=21, col="red", bg="yellow")
text(pl, "species", col="blue", cex=0.9)
# Default plot of the previous using identify to label selected points
## Not run: 
##D pl <- ordiplot(dune.mds)
##D identify(pl, "spec")
## End(Not run)




