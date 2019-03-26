library(SDraw)


### Name: voronoi.polygons
### Title: Calculate Voronoi polygons for a set of points
### Aliases: voronoi.polygons

### ** Examples


# Triangular grid inside a set of polygons
WA.samp <- sss.polygon(WA,100,triangular=TRUE) 

# Voronoi polygons of triangular grid 
WA.tess <- voronoi.polygons(WA.samp)

# Plot 
plot(WA)
plot(WA.tess, add=TRUE, col=rainbow(length(WA.samp)))
plot(WA.samp, add=TRUE, pch=16)

# One way to measure spatial balance: 
# Compare variance of Voronoi polygons to same sized 
# SRS sample.  
WA.bas <- bas.polygon(WA, 100)
WA.srs <- srs.polygon(WA, 100)
WA.bas.tess <- voronoi.polygons(WA.bas)
WA.srs.tess <- voronoi.polygons(WA.srs)
rel.balance <- var(WA.bas.tess$area)/var(WA.srs.tess$area)




