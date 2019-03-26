library(spgrass6)


### Name: gmeta6
### Title: Reads GRASS metadata from the current LOCATION
### Aliases: gmeta gmeta6 getLocationProj gmeta2grd print.gmeta
###   get.ignore.stderrOption get.stop_on_no_flags_parasOption
###   get.useGDALOption get.pluginOption get.echoCmdOption
###   get.useInternOption get.legacyExecOption get.defaultFlagsOption
###   get.suppressEchoCmdInFuncOption set.ignore.stderrOption
###   set.stop_on_no_flags_parasOption set.useGDALOption set.pluginOption
###   set.echoCmdOption set.useInternOption set.legacyExecOption
###   set.defaultFlagsOption set.suppressEchoCmdInFuncOption
### Keywords: spatial

### ** Examples

if (nchar(Sys.getenv("GISRC")) > 0) {
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



