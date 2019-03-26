library(adegraphics)


### Name: s.logo
### Title: 2-D scatter plot with logos (bitmap objects)
### Aliases: s.logo
### Keywords: aplot hplot

### ** Examples

data(ggtortoises, package = "ade4")
g1 <- s.logo(ggtortoises$pop, 
  ggtortoises$ico[as.character(ggtortoises$pop$carap)], 
  pori.incl = FALSE, ppoints.cex = 0.5)
g1 <- s.label(ggtortoises$pop, add = TRUE, plabels.boxes.alpha = 0)

g2 <- s.label(ggtortoises$misc, pgrid.draw = FALSE, 
  porigin.include = FALSE, paxes.draw = FALSE, 
  Sp = ggtortoises$Spatial, pback.col = "lightblue", pSp.col = "white")
g2 <- s.logo(ggtortoises$pop, ggtortoises$ico[as.character(ggtortoises$pop$carap)], 
  ppoints.cex = 0.5, add = TRUE)

data(capitales, package = "ade4")
g3 <- s.logo(capitales$xy[sort(rownames(capitales$xy)), ], capitales$logo, 
  Sp = capitales$Spatial, pback.col = "lightblue", pSp.col = "white", 
  pgrid.draw = FALSE)



