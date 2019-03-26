library(spgrass6)


### Name: readVECT6
### Title: Read and write GRASS 6+ vector object files
### Aliases: readVECT readVECT6 writeVECT writeVECT6 vInfo vColumns
###   vDataCount vect2neigh
### Keywords: spatial

### ** Examples

if (nchar(Sys.getenv("GISRC")) > 0) {
  require(rgdal)
  ois <- get.ignore.stderrOption()
  set.ignore.stderrOption(TRUE)
  if (execGRASS("g.version", intern=TRUE) > "GRASS 7") {
    execGRASS("v.info", map="bugsites", layer="1")
  } else {
    execGRASS("v.info", map="bugsites", layer=1L)
  }
  print(vInfo("bugsites"))
  bugs <- readVECT("bugsites", plugin=NULL)
  print(summary(bugs))
  bugs1 <- readVECT("bugsites", plugin=FALSE)
  print(summary(bugs1))
  writeVECT(bugs, "newbugs", v.in.ogr_flags=c("o", "overwrite"))
  if (execGRASS("g.version", intern=TRUE) > "GRASS 7") {
    execGRASS("v.info", map="newbugs", layer="1")
  } else {
    execGRASS("v.info", map="newbugs", layer=1L)
  }
  nbugs <- readVECT("newbugs")
  print(summary(nbugs))
  print(vInfo("roads"))
  roads <- readVECT("roads")
  print(summary(roads))
  set.ignore.stderrOption(ois)
}



