library(pgirmess)


### Name: QGIS2sp
### Title: Changes a copied-to-clipboard QGIS attribute table into a sp
###   Spatial object or a data.frame
### Aliases: QGIS2sp
### Keywords: misc

### ** Examples


  if((.Platform$OS.type == "windows") & (interactive())) {
  db <-c("wkt_geom\tname", "POINT(104.55 34.60)\tDENG_LING", "POINT(104.45 34.49)\tDIAO_GOU")
  writeLines(db, "clipboard")
  QGIS2sp() # to write in the console by hand (if copied and paste, one overwrites the clipboard)
  }





