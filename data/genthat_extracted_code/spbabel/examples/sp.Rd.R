library(spbabel)


### Name: sp
### Title: Convert from dplyr tbl form to Spatial*DataFrame.
### Aliases: sp sp.data.frame

### ** Examples

library(dplyr)
semap1 <- semap  %>% dplyr::filter(y_ > -89.9999)
sp_obj <- sp(semap1, attr_tab = seatt, crs = "+proj=longlat +ellps=WGS84")
## look, seamless Antarctica!
## library(rgdal); plot(spTransform(sp_obj, "+proj=laea +lat_0=-70"))



