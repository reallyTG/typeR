## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE)

## ------------------------------------------------------------------------
sqr2p1 <- sqrt(2) + 1
points <- rbind(
  c(-1, -sqr2p1, -sqr2p1, -sqr2p1),
  c(-1, -sqr2p1, -sqr2p1, sqr2p1),
  c(-1, -sqr2p1, sqr2p1, -sqr2p1),
  c(-1, -sqr2p1, sqr2p1, sqr2p1),
  c(-1, sqr2p1, -sqr2p1, -sqr2p1),
  c(-1, sqr2p1, -sqr2p1, sqr2p1),
  c(-1, sqr2p1, sqr2p1, -sqr2p1),
  c(-1, sqr2p1, sqr2p1, sqr2p1),
  c(1, -sqr2p1, -sqr2p1, -sqr2p1),
  c(1, -sqr2p1, -sqr2p1, sqr2p1),
  c(1, -sqr2p1, sqr2p1, -sqr2p1),
  c(1, -sqr2p1, sqr2p1, sqr2p1),
  c(1, sqr2p1, -sqr2p1, -sqr2p1),
  c(1, sqr2p1, -sqr2p1, sqr2p1),
  c(1, sqr2p1, sqr2p1, -sqr2p1),
  c(1, sqr2p1, sqr2p1, sqr2p1),
  c(-sqr2p1, -1, -sqr2p1, -sqr2p1),
  c(-sqr2p1, -1, -sqr2p1, sqr2p1),
  c(-sqr2p1, -1, sqr2p1, -sqr2p1),
  c(-sqr2p1, -1, sqr2p1, sqr2p1),
  c(-sqr2p1, 1, -sqr2p1, -sqr2p1),
  c(-sqr2p1, 1, -sqr2p1, sqr2p1),
  c(-sqr2p1, 1, sqr2p1, -sqr2p1),
  c(-sqr2p1, 1, sqr2p1, sqr2p1),
  c(sqr2p1, -1, -sqr2p1, -sqr2p1),
  c(sqr2p1, -1, -sqr2p1, sqr2p1),
  c(sqr2p1, -1, sqr2p1, -sqr2p1),
  c(sqr2p1, -1, sqr2p1, sqr2p1),
  c(sqr2p1, 1, -sqr2p1, -sqr2p1),
  c(sqr2p1, 1, -sqr2p1, sqr2p1),
  c(sqr2p1, 1, sqr2p1, -sqr2p1),
  c(sqr2p1, 1, sqr2p1, sqr2p1),
  c(-sqr2p1, -sqr2p1, -1, -sqr2p1),
  c(-sqr2p1, -sqr2p1, -1, sqr2p1),
  c(-sqr2p1, -sqr2p1, 1, -sqr2p1),
  c(-sqr2p1, -sqr2p1, 1, sqr2p1),
  c(-sqr2p1, sqr2p1, -1, -sqr2p1),
  c(-sqr2p1, sqr2p1, -1, sqr2p1),
  c(-sqr2p1, sqr2p1, 1, -sqr2p1),
  c(-sqr2p1, sqr2p1, 1, sqr2p1),
  c(sqr2p1, -sqr2p1, -1, -sqr2p1),
  c(sqr2p1, -sqr2p1, -1, sqr2p1),
  c(sqr2p1, -sqr2p1, 1, -sqr2p1),
  c(sqr2p1, -sqr2p1, 1, sqr2p1),
  c(sqr2p1, sqr2p1, -1, -sqr2p1),
  c(sqr2p1, sqr2p1, -1, sqr2p1),
  c(sqr2p1, sqr2p1, 1, -sqr2p1),
  c(sqr2p1, sqr2p1, 1, sqr2p1),
  c(-sqr2p1, -sqr2p1, -sqr2p1, -1),
  c(-sqr2p1, -sqr2p1, -sqr2p1, 1),
  c(-sqr2p1, -sqr2p1, sqr2p1, -1),
  c(-sqr2p1, -sqr2p1, sqr2p1, 1),
  c(-sqr2p1, sqr2p1, -sqr2p1, -1),
  c(-sqr2p1, sqr2p1, -sqr2p1, 1),
  c(-sqr2p1, sqr2p1, sqr2p1, -1),
  c(-sqr2p1, sqr2p1, sqr2p1, 1),
  c(sqr2p1, -sqr2p1, -sqr2p1, -1),
  c(sqr2p1, -sqr2p1, -sqr2p1, 1),
  c(sqr2p1, -sqr2p1, sqr2p1, -1),
  c(sqr2p1, -sqr2p1, sqr2p1, 1),
  c(sqr2p1, sqr2p1, -sqr2p1, -1),
  c(sqr2p1, sqr2p1, -sqr2p1, 1),
  c(sqr2p1, sqr2p1, sqr2p1, -1),
  c(sqr2p1, sqr2p1, sqr2p1, 1)
)

## ------------------------------------------------------------------------
library(cxhull)
hull <- cxhull(points)
str(hull, max = 1)

## ------------------------------------------------------------------------
all(names(hull$vertices) == 1:64)

## ------------------------------------------------------------------------
table(sapply(hull$facets, function(cell) length(cell$ridges)))

## ------------------------------------------------------------------------
sproj <- function(p, r){
  c(p[1], p[2], p[3])/(r-p[4])
}
ppoints <- t(apply(points, 1, 
                   function(point) sproj(point, sqrt(1+3*sqr2p1^2))))

## ---- message=FALSE------------------------------------------------------
edges <- hull$edges
library(rgl)
open3d(windowRect = c(100,100,600,600))
view3d(45,45)
spheres3d(ppoints, radius= 0.07, color = "orange")
for(i in 1:nrow(edges)){
  shade3d(cylinder3d(rbind(ppoints[edges[i,1],],ppoints[edges[i,2],]), 
                     radius = 0.05, sides = 30), col="gold")
}
rglwidget()

## ------------------------------------------------------------------------
ridgeSizes <- sapply(hull$ridges, function(ridge) length(ridge$vertices))
triangles <- t(sapply(hull$ridges[which(ridgeSizes==3)], 
                      function(ridge) ridge$vertices))
head(triangles)

## ---- message=FALSE------------------------------------------------------
for(i in 1:nrow(triangles)){
  triangles3d(rbind(
    ppoints[triangles[i,1],],
    ppoints[triangles[i,2],],
    ppoints[triangles[i,3],]),
    color = "red", alpha = 0.4)
}
rglwidget()

## ------------------------------------------------------------------------
open3d(windowRect = c(100,100,600,600))
view3d(45,45)
spheres3d(ppoints, radius= 0.07, color = "orange")
for(i in 1:nrow(edges)){
  shade3d(cylinder3d(rbind(ppoints[edges[i,1],],ppoints[edges[i,2],]),
                     radius = 0.05, sides = 30), col="gold")
}
cellSizes <- sapply(hull$facets, function(cell) length(cell$ridges))
tetrahedra <- hull$facets[which(cellSizes == 4)]
colors <- rainbow(16)
for(i in seq_along(tetrahedra)){
  triangles <- tetrahedra[[i]]$ridges
  for(j in 1:4){
    triangle <- hull$ridges[[triangles[j]]]$vertices
    triangles3d(rbind(
      ppoints[triangle[1],],
      ppoints[triangle[2],],
      ppoints[triangle[3],]),
      color = colors[i], alpha = 0.4)
  }
}
rglwidget()

