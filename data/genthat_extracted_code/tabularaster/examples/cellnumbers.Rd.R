library(tabularaster)


### Name: cellnumbers
### Title: Extract cell numbers from a Raster object.
### Aliases: cellnumbers cellnumbers cellnumbers.default cellnumbers
###   cellnumbers.SpatialLines cellnumbers cellnumbers.sfc cellnumbers
###   cellnumbers.sf

### ** Examples

library(raster)
library(dplyr)
r <- raster(volcano) %>% aggregate(fact = 4)
cellnumbers(r, rasterToContour(r, level = 120))
#library(dplyr)

#cr <- cut(r,  pretty(values(r)))
#p <- raster::rasterToPolygons(cr, dissolve = TRUE)
#p <- spex::qm_rasterToPolygons_sp(cr)
#tt <- cellnumbers(cr, p)
#library(dplyr)
#tt %>% mutate(v = extract(r, cell_)) %>% 
#group_by(object_) %>% 
#summarize(mean(v)) 
#head(pretty(values(r)), -1)



