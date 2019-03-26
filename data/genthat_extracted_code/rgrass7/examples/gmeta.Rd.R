library(rgrass7)


### Name: gmeta
### Title: Reads GRASS metadata from the current LOCATION
### Aliases: gmeta getLocationProj gmeta2grd print.gmeta
###   get.ignore.stderrOption get.stop_on_no_flags_parasOption
###   get.useGDALOption get.pluginOption get.echoCmdOption
###   get.useInternOption get.legacyExecOption get.defaultFlagsOption
###   get.suppressEchoCmdInFuncOption set.ignore.stderrOption
###   set.stop_on_no_flags_parasOption set.useGDALOption set.pluginOption
###   set.echoCmdOption set.useInternOption set.legacyExecOption
###   set.defaultFlagsOption set.suppressEchoCmdInFuncOption
### Keywords: spatial

### ** Examples

if (nchar(Sys.getenv("GISRC")) > 0 &&
  read.dcf(Sys.getenv("GISRC"))[1,"LOCATION_NAME"] == "nc_basic_spm_grass7") {
  G <- gmeta()
  print(G)
  CRS(getLocationProj())
  grd <- gmeta2grd()
  print(grd)
  ncells <- prod(slot(grd, "cells.dim"))
  df <- data.frame(k=rep(1, ncells))
  mask_SG <- SpatialGridDataFrame(grd, data=df)
  print(summary(mask_SG))
}



