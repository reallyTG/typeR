## ----fig.width=9, fig.height = 9-----------------------------------------
library(rbgm)
library(bgmfiles)

library(rgdal)

## turn +proj into line separated text
breakproj <- function(x) {
  paste(strsplit(x, " ")[[1]], collapse = "\n")
}
files <- bgmfiles()
for (i in seq_along(files)) {
  bgm <- bgmfile(files[i])
  boxes <- boxSpatial(bgm)
  plot(boxes, col = ifelse(boxes$boundary, "#88888880", sample(rainbow(nrow(boxes), alpha = 0.5))))
  op <- par(xpd = NA)
  llgridlines(boxes)
  par(op)
  title(basename(files[i]), cex = 0.8)
  mtext(breakproj(proj4string(boxes)), cex = 0.75, side = 2, las = 1, adj = 0, line = 2, at = par("usr")[3], xpd = NA)
 
}



## ---- eval = FALSE-------------------------------------------------------
#  library(rbgm)
#  library(bgmfiles)
#  library(mapview)
#  
#  
#  mp <- mapview()  ## empty map view
#  
#  fs <- bgmfiles::bgmfiles()  ## paths of all files collected
#  cols <- rainbow(length(fs), alpha = 0.2)
#  ## read in all boxes, convert to SpatialPolygonsDataFrame, and add to the map view
#  for (i in seq_along(fs)) {
#    mp <- mp + mapview(boxSpatial(bgmfile(fs[i])), color = cols[i], alpha = 0.3, layer.name = basename(fs[i]))
#  }
#  
#  ## view the mapview
#  mp
#  

## ----eval=FALSE, include = FALSE-----------------------------------------
#  Convert each to XYZ on the globe and plot.
#  
#  #devtools::install_github("mdsumner/gris", ref = "cran-sprint")
#  library(gris)
#  for (i in seq_along(files)) {
#    bgm <- bgmfile(files[i])
#    boxes <- boxSpatial(bgm)
#    bll <- if (isLonLat(boxes)) boxes else spTransform(boxes, "+proj=longlat +ellps=WGS84")
#   g <- gris(bll)
#   gt <- triangulate(g)
#   plot3d(gt, add = i > 1)
#  }
#  
#  plot3d(triangulate(gris(wrld_simpl)), add = TRUE, col = "black")
#  rgl::light3d(specular = "aliceblue", viewpoint.rel = FALSE)
#  rgl::bg3d("black")

