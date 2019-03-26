## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
pfile <- system.file("extdata", "point.shp", package = "vapour")
library(vapour)
vapour_read_attributes(pfile)

## ------------------------------------------------------------------------
mvfile <- system.file("extdata", "tab", "list_locality_postcode_meander_valley.tab", package="vapour")

dat <- as.data.frame(vapour_read_attributes(mvfile),  stringsAsFactors = FALSE)

dim(dat)

head(dat)

## ------------------------------------------------------------------------
vapour_read_geometry(pfile)[5:6]  ## format = "WKB"

vapour_read_geometry_text(pfile)[5:6]  ## format = "json"

vapour_read_geometry_text(pfile, textformat = "gml")[2]

## don't do this with a non-longlat data set like cfile
vapour_read_geometry_text(pfile, textformat = "kml")[1:2]

cfile <- system.file("extdata/sst_c.gpkg", package = "vapour")
str(vapour_read_geometry_text(cfile, textformat = "wkt")[1:2])


## ------------------------------------------------------------------------
library(dplyr)
dat <- as.data.frame(vapour_read_attributes(cfile),  stringsAsFactors = FALSE) %>%
    dplyr::mutate(wkt = vapour_read_geometry_text(cfile, textformat = "wkt"))
glimpse(dat)

## ------------------------------------------------------------------------
mvfile <- system.file("extdata", "tab", "list_locality_postcode_meander_valley.tab", package="vapour")
str(head(vapour_read_extent(mvfile)))


## ----raster--------------------------------------------------------------
f <- system.file("extdata", "sst.tif", package = "vapour")
vapour_raster_info(f)


## ------------------------------------------------------------------------
vapour_read_attributes(mvfile, sql = "SELECT NAME, PLAN_REF FROM list_locality_postcode_meander_valley WHERE POSTCODE = 7310")


vapour_read_attributes(mvfile, sql = "SELECT NAME, PLAN_REF, FID FROM list_locality_postcode_meander_valley WHERE POSTCODE = 7306")


## ------------------------------------------------------------------------
library(vapour)
file0 <- "list_locality_postcode_meander_valley.tab"
mvfile <- system.file("extdata/tab", file0, package="vapour")
layer <- gsub(".tab$", "", basename(mvfile))
## get the number of features by FID (DISTINCT should be redundant here)
vapour_read_attributes(mvfile, sql = sprintf("SELECT COUNT(DISTINCT FID) AS nfeatures FROM %s", layer))

## note how TAB is 1-based 
vapour_read_attributes(mvfile, sql = sprintf("SELECT COUNT(*) AS n FROM %s WHERE FID < 2", layer))

## but SHP is 0-based
shp <- system.file("extdata/point.shp", package="vapour")
vapour_read_attributes(shp, sql = sprintf("SELECT COUNT(*) AS n FROM %s WHERE FID < 2", "point"))

