library(rgrass7)


### Name: readVECT
### Title: Read and write GRASS 7 vector object files
### Aliases: readVECT writeVECT vInfo vColumns vDataCount vect2neigh
### Keywords: spatial

### ** Examples

if (nchar(Sys.getenv("GISRC")) > 0 &&
  read.dcf(Sys.getenv("GISRC"))[1,"LOCATION_NAME"] == "nc_basic_spm_grass7") {
  GV <- Sys.getenv("GRASS_VERBOSE")
  Sys.setenv("GRASS_VERBOSE"=0)
  require(rgdal)
  ois <- get.ignore.stderrOption()
  set.ignore.stderrOption(TRUE)
  execGRASS("v.info", map="schools", layer="1")
  print(vInfo("schools"))
  schs <- readVECT("schools", plugin=NULL)
  print(summary(schs))
  schs1 <- readVECT("schools", plugin=FALSE)
  print(summary(schs1))
  writeVECT(schs, "newsch", v.in.ogr_flags=c("o", "overwrite"))
  execGRASS("v.info", map="newsch", layer="1")
  nschs <- readVECT("newsch")
  print(summary(nschs))
  print(all.equal(names(nschs), as.character(vColumns("newsch")[,2])))
  names(nschs) <- paste("ABCDEFGHIJKLMNO", names(nschs), sep="")
  writeVECT(nschs, "newsch1", v.in.ogr_flags=c("o", "overwrite"))
  print(all.equal(names(nschs), as.character(vColumns("newsch1")[-1,2])))
  nschs1 <- readVECT("newsch1")
  print(all.equal(names(nschs), names(nschs1)[-1]))
  print(summary(nschs1))
  schs <- readVECT("schools", driver="ESRI Shapefile")
  names(schs) <- paste("ABCDEFGHIJKLMNO", names(schs), sep="")
  writeVECT(schs, "newsch", v.in.ogr_flags=c("o", "overwrite"),
    driver="ESRI Shapefile")
  print(all.equal(names(schs), as.character(vColumns("newsch")[-1,2])))
  nschs <- readVECT("newsch", driver="ESRI Shapefile")
  all.equal(names(schs), names(nschs)[-1])
  print(vInfo("roadsmajor"))
  roads <- readVECT("roadsmajor")
  print(summary(roads))
  cen_neig <- vect2neigh("census")
  str(cen_neig)
  Sys.setenv("GRASS_VERBOSE"=GV)
  set.ignore.stderrOption(ois)
}



