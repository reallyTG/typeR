library(vapour)


### Name: sst_c
### Title: SST contours
### Aliases: sst_c

### ** Examples

## library(sf)
## plot(sst_c)
f <- system.file("extdata/sst_c.gpkg", package = "vapour")

## create an equivalent but class-less form of sst_c  with GeoJSON rather than sf sfc format
atts <- vapour_read_attributes(f)
dat <- as.data.frame(atts, stringsAsFactors = FALSE)
dat[["json"]] <- vapour_read_geometry_text(f)
names(dat)
names(sst_c)



