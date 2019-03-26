library(rgrass7)


### Name: readRAST
### Title: Read and write GRASS 7 raster files
### Aliases: readRAST writeRAST
### Keywords: spatial

### ** Examples

if (nchar(Sys.getenv("GISRC")) > 0 &&
  read.dcf(Sys.getenv("GISRC"))[1,"LOCATION_NAME"] == "nc_basic_spm_grass7") {
  GV <- Sys.getenv("GRASS_VERBOSE")
  Sys.setenv("GRASS_VERBOSE"=0)
  require(rgdal)
  ois <- get.ignore.stderrOption()
  set.ignore.stderrOption(TRUE)
  get.useGDALOption()
  nc_basic <- readRAST(c("geology", "elevation"), cat=c(TRUE, FALSE),
    useGDAL=FALSE)
  nc_basic <- readRAST(c("geology", "elevation"), cat=c(TRUE, FALSE),
    useGDAL=TRUE)
  print(table(nc_basic$geology))
  execGRASS("r.stats", flags=c("c", "l", "quiet"), input="geology")
  boxplot(nc_basic$elevation ~ nc_basic$geology)
  nc_basic$sqdem <- sqrt(nc_basic$elevation)
  if ("GRASS" %in% gdalDrivers()$name) {
    execGRASS("g.region", raster="elevation")
    dem1 <- readRAST("elevation", plugin=TRUE, mapset="PERMANENT")
    print(summary(dem1))
    execGRASS("g.region", raster="elevation")
  }
  writeRAST(nc_basic, "sqdemSP", zcol="sqdem", flags="quiet")
  execGRASS("r.info", map="sqdemSP")
  execGRASS("g.remove", flags="f", name="sqdemSP", type="raster")
  writeRAST(nc_basic, "sqdemSP", zcol="sqdem", useGDAL=TRUE, flags="quiet")
  execGRASS("r.info", map="sqdemSP")
  print(system.time(sqdemSP <- readRAST(c("sqdemSP", "elevation"),
    useGDAL=TRUE, return_SGDF=FALSE)))
  print(system.time(sqdemSP <- readRAST(c("sqdemSP", "elevation"),
    useGDAL=TRUE, return_SGDF=TRUE)))
  print(system.time(sqdemSP <- readRAST(c("sqdemSP", "elevation"),
    useGDAL=FALSE, return_SGDF=TRUE)))
  print(system.time(sqdemSP <- readRAST(c("sqdemSP", "elevation"),
    useGDAL=FALSE, return_SGDF=FALSE)))
  str(sqdemSP)
  mat <- do.call("cbind", sqdemSP$dataList)
  str(mat)
  print(system.time(SGDF <- SpatialGridDataFrame(grid=sqdemSP$grid,
    proj4string=sqdemSP$proj4string, data=as.data.frame(sqdemSP$dataList))))
  summary(SGDF)
  execGRASS("g.remove", flags="f", name="sqdemSP", type="raster")
  execGRASS("r.mapcalc", expression="basins0 = basins - 1")
  execGRASS("r.stats", flags="c", input="basins0")
  basins0 <- readRAST("basins0")
  print(table(basins0$basins0))
  basins0 <- readRAST("basins0", plugin=FALSE)
  print(table(basins0$basins0))
  execGRASS("g.remove", flags="f", name="basins0", type="raster")
  Sys.setenv("GRASS_VERBOSE"=GV)
  set.ignore.stderrOption(ois)
}



