## ---- eval=FALSE---------------------------------------------------------
#  cellnumbers(r, q)

## ------------------------------------------------------------------------
library(raster)
library(tabularaster)
(r <- raster(volcano))
(cell <- cellnumbers(r, cbind(0.5, 0.5)))

## ------------------------------------------------------------------------
xyFromCell(r, cell$cell_)


raster::extract(r, cell$cell_)

## ------------------------------------------------------------------------
library(dplyr)
as_tibble(r)
b <- brick(r, r*2)
as_tibble(b)
as_tibble(b, cell = FALSE) %>% arrange(desc(dimindex)) ## leave out the cell index

## ------------------------------------------------------------------------
btime <- setZ(b, Sys.time() + c(1, 10))
as_tibble(btime) %>% group_by(dimindex) %>% summarize(n = n())

as_tibble(btime, split_date = TRUE)


## ------------------------------------------------------------------------
library(tabularaster)
## https://gis.stackexchange.com/questions/102870/step-by-step-how-do-i-extract-raster-values-from-polygon-overlay-with-q-gis-or

library(raster)

# Create integer class raster
r <- raster(ncol=36, nrow=18)
r[] <- round(runif(ncell(r),1,10),digits=0)

# Create two polygons
cds1 <- rbind(c(-180,-20), c(-160,5), c(-60, 0), c(-160,-60), c(-180,-20))
cds2 <- rbind(c(80,0), c(100,60), c(120,0), c(120,-55), c(80,0))
polys <- SpatialPolygonsDataFrame(SpatialPolygons(list(Polygons(list(Polygon(cds1)), 1), 
                                                       Polygons(list(Polygon(cds2)), 2))),data.frame(ID=c(1,2)))

## do extraction in abstract terms
(cn <- cellnumbers(r, polys))

library(dplyr)
## now perform extraction for real
## and pipe into grouping by polygon (object_) and value, and
## calculate class percentage from class counts per polygon
cn %>% mutate(v = raster::extract(r, cell_)) %>% group_by(object_, v) %>% summarize(count = n()) %>% 
  mutate(v.pct = count / sum(count)) 

## here is the traditional code used in the stackoverflow example
# Extract raster values to polygons                             
#( v <- extract(r, polys) )
# Get class counts for each polygon
#v.counts <- lapply(v,table)
# Calculate class percentages for each polygon
#( v.pct <- lapply(v.counts, FUN=function(x){ x / sum(x) } ) )



## ------------------------------------------------------------------------
library(tabularaster)
data("ghrsst")  ## a RasterLayer
data("sst_regions") ## a polygon layer, contiguous with ghrsst

gcells <- cellnumbers(ghrsst, sst_regions) %>% mutate(object_ = as.integer(object_))

result <- gcells %>% mutate(sst = raster::extract(ghrsst, cell_)) %>% 
  group_by(object_) %>% 
  summarize_at(vars(sst), funs(mean(., na.rm = TRUE), sd(., na.rm = TRUE), length))

library(spdplyr)
sst_regions <- sst_regions %>% inner_join(result, c("ghrsst" = "object_"))

plot(ghrsst, col = bpy.colors(30), addfun = function() plot(sst_regions, add = TRUE), 
     main = "SST data with simple regional polygon layer")
#library(sf)
plot(sst_regions)

## ------------------------------------------------------------------------
library(tabularaster)
library(raster)
library(dplyr)
data("rastercano")
data("polycano")
cells <- cellnumbers(rastercano, polycano[4:5, ])


cellnumbers(rastercano, as(polycano[4:5, ], "SpatialLinesDataFrame"))
cellnumbers(rastercano, as(as(polycano[4:5, ], "SpatialLinesDataFrame"), "SpatialPointsDataFrame"))

## ----eval = FALSE--------------------------------------------------------
#  poly <- sf::st_sf(a = 1, geometry = sf::st_sfc(sf::st_polygon(list(
#    cbind(c(0.57, 0.55, 0.19, 0.43, 0.82, 0.57),
#          c(0.22, 0.24, 0.46, 0.77, 0.56, 0.22))))))
#  
#  
#  
#  
#  xweight <- cellnumbers(rastercano, poly, weights = TRUE)
#  
#  dgrid <- setValues(rastercano, NA_real_)
#  dgrid[xweight$cell_] <- xweight$weight_
#  plot(dgrid, main = "cell weights based on partial overlap", col = viridis::viridis(9),
#       addfun = function() polygon(poly$geometry[[c(1, 1)]]))
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(sf)
#  
#  poly <- read_sf(system.file("shape/nc.shp", package="sf"))
#  library(spex)
#  extent(poly)
#  spex(poly)
#  ## we can't do this
#  try(grid <-  raster(poly))
#  
#  ## but we can do
#  
#  (grid <- raster(spex(poly), nrow = 100, ncol = 140))
#  
#  ## index the raster with the sf layer
#  (cn <- cellnumbers(grid, poly))
#  
#  grid[cn$cell_] <- cn$object_
#  
#  ## we slasterized it (slow rasterize)
#  plot(grid)
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  ## fasterize it
#  library(fasterize)
#  #poly$object_ <- as.integer(seq_len(nrow(poly)))
#  fgrid <- fasterize(poly, grid, field = "AREA")
#  scl <- function(x) {rg <- range(x, na.rm = TRUE); (x   - rg[1])/diff(rg)}
#  plot(xyFromCell(grid, cn$cell_), pch = 19, cex = 0.4, col = bpy.colors(26)[scl(raster::extract(fgrid, cn$cell_)) * 25 + 1])

## ----eval=FALSE----------------------------------------------------------
#  library(spex)
#  library(raster)
#  library(tabularaster)
#  ## but we can do
#  (grid <- raster(spex(sst_regions), res = 0.2))
#  system.time({
#  library(velox)
#  vx <- velox(setValues(grid, 0))
#  vx$rasterize(sf::st_as_sf(sst_regions), field = "ghrsst")
#  
#  library(dplyr)
#  res1 <- as_tibble(vx$as.RasterLayer()) %>%
#    #rename(object_ = cellvalue) %>%
#    filter(!is.na(cellvalue))
#  })
#  
#  
#  system.time({
#    res2 <- as_tibble(rasterize(sst_regions, grid, field = sst_regions$ghrsst))
#  })
#  
#  vcellnumbers <- function(x, query, ...) {
#    query$object_ <- seq_len(nrow(query))
#    query <- sf::st_as_sf(query)
#    x <- setValues(x[[1]], 1)
#    vx <- velox(x)
#    vx$rasterize(query, field = "object_")
#    vx$as.RasterLayer() %>%
#      as_tibble(na.rm = FALSE) %>%
#      dplyr::rename(object_ = cellvalue, cell_ = cellindex)
#  }
#  vcellnumbers(grid, sst_regions)
#  cellnumbers(grid, sst_regions)

