library(netdiffuseR)


### Name: edges_coords
### Title: Compute ego/alter edge coordinates considering alter's size and
###   aspect ratio
### Aliases: edges_coords
### Keywords: dplot misc

### ** Examples

# --------------------------------------------------------------------------
data(medInnovationsDiffNet)
library(sna)

# Computing coordinates
set.seed(79)
coords <- sna::gplot(as.matrix(medInnovationsDiffNet$graph[[1]]))

# Getting edge coordinates
vcex <- rep(1.5, nnodes(medInnovationsDiffNet))
ecoords <- edges_coords(
  medInnovationsDiffNet$graph[[1]],
  diffnet.toa(medInnovationsDiffNet),
  x = coords[,1], y = coords[,2],
  vertex_cex = vcex,
  dev = par("pin")
  )

ecoords <- as.data.frame(ecoords)

# Plotting
symbols(coords[,1], coords[,2], circles=vcex,
  inches=FALSE, xaxs="i", yaxs="i")

with(ecoords, arrows(x0,y0,x1,y1, length=.1))



