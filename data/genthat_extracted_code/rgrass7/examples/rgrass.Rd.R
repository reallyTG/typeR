library(rgrass7)


### Name: rgrass7-package
### Title: Interface between GRASS geographical information system and R
### Aliases: rgrass7-package rgrass7
### Keywords: package spatial

### ** Examples

if (nchar(Sys.getenv("GISRC")) > 0 &&
  read.dcf(Sys.getenv("GISRC"))[1,"LOCATION_NAME"] == "nc_basic_spm_grass7") {
  require(rgdal)
  elevation <- readRAST("elevation", ignore.stderr=TRUE, plugin=FALSE)
  summary(elevation)
  grd <- gmeta2grd(ignore.stderr=TRUE)
  grd
  set.seed(1)
  pts <- spsample(elevation, 200, "random")
  smple <- SpatialPointsDataFrame(pts, data=over(pts, elevation))
  summary(smple)
  writeVECT(smple, "sp_dem", v.in.ogr_flags=c("overwrite", "o"), ignore.stderr=TRUE)
  bugsDF <- readVECT("schools", ignore.stderr=TRUE, mapset="PERMANENT")
  summary(bugsDF)
  vInfo("streams", ignore.stderr=TRUE)
  vColumns("streams", ignore.stderr=TRUE)
  vDataCount("streams", ignore.stderr=TRUE)
  streams <- readVECT("streams", type="line",
    remove.duplicates=FALSE, ignore.stderr=TRUE, plugin=FALSE)
  summary(streams)
}



