library(spgrass6)


### Name: readRAST
### Title: Read and write GRASS 6+ raster files
### Aliases: readRAST readRAST6 writeRAST writeRAST6
### Keywords: spatial

### ** Examples

if (nchar(Sys.getenv("GISRC")) > 0) {
  require(rgdal)
  ois <- get.ignore.stderrOption()
  set.ignore.stderrOption(TRUE)
  get.useGDALOption()
  spear <- readRAST(c("geology", "elevation.dem"), cat=c(TRUE, FALSE),
    useGDAL=FALSE)
  spear <- readRAST(c("geology", "elevation.dem"), cat=c(TRUE, FALSE),
    useGDAL=TRUE)
  print(table(spear$geology))
  execGRASS("r.stats", flags=c("c", "l", "quiet"), input="geology")
  boxplot(spear$elevation.dem ~ spear$geology)
  spear$sqdem <- sqrt(spear$elevation.dem)
  if ("GRASS" %in% gdalDrivers()$name) {
    execGRASS("g.region", rast="elevation.dem")
    dem1 <- readRAST("elevation.dem", plugin=TRUE, mapset="PERMANENT")
    print(summary(dem1))
    execGRASS("g.region", rast="elevation.dem")
  }
  writeRAST(spear, "sqdemSP", zcol="sqdem")
  execGRASS("r.info", map="sqdemSP")
  execGRASS("g.remove", rast="sqdemSP")
  writeRAST(spear, "sqdemSP", zcol="sqdem", useGDAL=TRUE)
  execGRASS("r.info", map="sqdemSP")
  print(system.time(sqdemSP <- readRAST(c("sqdemSP", "elevation.dem"),
    useGDAL=TRUE, return_SGDF=FALSE)))
  print(system.time(sqdemSP <- readRAST(c("sqdemSP", "elevation.dem"),
    useGDAL=TRUE, return_SGDF=TRUE)))
  print(system.time(sqdemSP <- readRAST(c("sqdemSP", "elevation.dem"),
    useGDAL=FALSE, return_SGDF=TRUE)))
  print(system.time(sqdemSP <- readRAST(c("sqdemSP", "elevation.dem"),
    useGDAL=FALSE, return_SGDF=FALSE)))
  str(sqdemSP)
  mat <- do.call("cbind", sqdemSP$dataList)
  str(mat)
  print(system.time(SGDF <- SpatialGridDataFrame(grid=sqdemSP$grid,
    proj4string=sqdemSP$proj4string, data=as.data.frame(sqdemSP$dataList))))
  summary(SGDF)
  execGRASS("g.remove", rast="sqdemSP")
  if (execGRASS("g.version", intern=TRUE) > "GRASS 7") {
    execGRASS("r.mapcalc", expression="quads0 = quads - 1")
  } else {
    execGRASS("r.mapcalculator", outfile="quads0",
      amap="quads", formula='A - 1')
  }
  execGRASS("r.stats", flags="c", input="quads0")
  quads0 <- readRAST("quads0")
  print(table(quads0$quads0))
  quads0 <- readRAST("quads0", plugin=FALSE)
  print(table(quads0$quads0))
  execGRASS("g.remove", rast="quads0")
  set.ignore.stderrOption(ois)
}



