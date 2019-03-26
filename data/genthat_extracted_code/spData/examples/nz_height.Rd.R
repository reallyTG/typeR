library(spData)


### Name: nz_height
### Title: High points in New Zealand
### Aliases: nz_height
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  summary(nz_height)
  plot(nz$geom)
  plot(nz_height$geom, add = TRUE)
}
## Not run: 
##D library(dplyr)
##D # After downloading data
##D unzip("lds-nz-height-points-topo-150k-SHP.zip")
##D nz_height = st_read("nz-height-points-topo-150k.shp") %>% 
##D   top_n(n = 100, wt = elevation)
##D library(tmap)
##D tmap_mode("view")
##D qtm(nz) +
##D   qtm(nz_height)
##D f = list.files(pattern = "*nz-height*")
##D file.remove(f)
## End(Not run)



