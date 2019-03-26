library(spgrass6)


### Name: execGRASS
### Title: Run GRASS commands
### Aliases: execGRASS doGRASS parseGRASS getXMLencoding setXMLencoding
###   print.GRASS_interface_desc
### Keywords: spatial

### ** Examples

if (nchar(Sys.getenv("GISRC")) > 0) {
  oechoCmd <- get.echoCmdOption()
  set.echoCmdOption(TRUE)
  print(parseGRASS("r.slope.aspect"))
  doGRASS("r.slope.aspect", flags=c("overwrite"),
    elevation="elevation.dem", slope="slope", aspect="aspect")
  pars <- list(elevation="elevation.dem", slope="slope", aspect="aspect")
  doGRASS("r.slope.aspect", flags=c("overwrite"), parameters=pars)
  print(parseGRASS("r.buffer"))
  doGRASS("r.buffer", flags=c("overwrite"), input="bugsites", output="bmap",
    distances=seq(1000,15000,1000))
  pars <- list(input="bugsites", output="bmap", distances=seq(1000,15000,1000))
  doGRASS("r.buffer", flags=c("overwrite"), parameters=pars)
  set.echoCmdOption(oechoCmd)
  try(res <- execGRASS("r.stats", input = "fire_blocksgg", # no such file
    flags = c("C", "n")), silent=FALSE)
  res <- execGRASS("r.stats", input = "fire_blocksgg", flags = c("C", "n"),
    legacyExec=TRUE)
  print(res)
  if (res != 0) {
    resERR <- execGRASS("r.stats", input = "fire_blocksgg", 
      flags = c("C", "n"), redirect=TRUE, legacyExec=TRUE)
    print(resERR)
  }
}



