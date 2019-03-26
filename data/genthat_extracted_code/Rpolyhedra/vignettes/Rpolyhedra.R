## ----setup, include=FALSE------------------------------------------------
library(rgl)
library(Rpolyhedra)
setupKnitr()

## ----availablePolyhedra--------------------------------------------------
#show only the first 10 polyhedra.
head(getAvailablePolyhedra(), n = 10)

## ----getPolyhedron-------------------------------------------------------
cube <- getPolyhedron(source = "netlib", polyhedron.name = "cube")

## ----demo, webgl=TRUE----------------------------------------------------
polyhedra.2.draw <- getAvailablePolyhedra(source = "netlib")
polyhedra.2.draw <- polyhedra.2.draw[polyhedra.2.draw$scraped.name %in%
        c("tetrahedron",
          "octahedron",
          "cube",
          "icosahedron",
          "dodecahedron"),]

n <- nrow(polyhedra.2.draw)
polyhedron.colors <- rainbow(n)
polyhedron.scale <- 5
open3d()
par3d(FOV = 1)
rgl.bg( sphere =FALSE, fogtype = "none", color=c("black"))
rgl.viewpoint(theta = 0,phi=0,zoom=0.8,fov=1)
for (i in seq_len(n)) {
  polyhedron.row <- polyhedra.2.draw[i,]
  polyhedron.name <- polyhedron.row$scraped.name
  polyhedron <- getPolyhedron(source = polyhedron.row$source, polyhedron.name)
  current.angle <- i/n * 2 * pi
  tm <- rotationMatrix(current.angle, 1,0,0)
  x.pos <- round(polyhedron.scale * sin(current.angle), 2)
  y.pos <- round(polyhedron.scale * cos(current.angle), 2)
  tm <- tm %*% translationMatrix(x.pos,y.pos,0)
  print(paste("Drawing ",polyhedron.name," rotated ", round(current.angle,2),
              " in (1,0,0) axis. Translated to (",x.pos,",",y.pos,",0)",
              " with color ",polyhedron.colors[i], sep = ""))
  shape.rgl <- polyhedron$getRGLModel(transformation.matrix = tm)
  shade3d(shape.rgl, color = polyhedron.colors[i])
}

