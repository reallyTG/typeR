library(spgrass6)


### Name: spgrass6-package
### Title: Interface between GRASS geographical information system and R
### Aliases: spgrass6-package spgrass6
### Keywords: package spatial

### ** Examples

if (nchar(Sys.getenv("GISRC")) > 0) {
  require(rgdal)
  soilsph <- readRAST("soils.ph", ignore.stderr=TRUE, plugin=FALSE)
  summary(soilsph)
  grd <- gmeta2grd(ignore.stderr=TRUE)
  grd
  set.seed(1)
  pts <- spsample(soilsph, 200, "random")
  smple <- SpatialPointsDataFrame(pts, data=over(pts, soilsph))
  summary(smple)
  writeVECT(smple, "sp_dem", v.in.ogr_flags="overwrite", ignore.stderr=TRUE)
  bugsDF <- readVECT("bugsites", ignore.stderr=TRUE, mapset="PERMANENT")
  summary(bugsDF)
  vInfo("streams", ignore.stderr=TRUE)
  vColumns("streams", ignore.stderr=TRUE)
  vDataCount("streams", ignore.stderr=TRUE)
  streams <- readVECT("streams", type="line,boundary",
    remove.duplicates=FALSE, ignore.stderr=TRUE, plugin=FALSE)
  summary(streams)
}



