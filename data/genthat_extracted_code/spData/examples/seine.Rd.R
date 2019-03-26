library(spData)


### Name: seine
### Title: Small river network in France
### Aliases: seine rivers
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  seine
  plot(seine)
}
## Not run: 
##D library(sf)
##D library(rnaturalearth)
##D library(tidyverse)
##D 
##D seine = ne_download(scale = 10, type = "rivers_lake_centerlines", 
##D                     category = "physical", returnclass = "sf") %>% 
##D         filter(name %in% c("Yonne", "Seine", "Marne")) %>% 
##D         select(name = name_en) %>% 
##D         st_transform(2154)
## End(Not run)



