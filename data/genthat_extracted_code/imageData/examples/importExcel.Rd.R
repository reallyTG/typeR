library(imageData)


### Name: importExcel
### Title: Imports an Excel imaging file and allows some renaming of
###   variables
### Aliases: importExcel
### Keywords: data manip

### ** Examples
## Not run: 
##D raw.0169.dat <- importExcel(file = "0169 analysis_20140603.xlsx", 
##D                             startTime = "2013-05-23 8:00 AM")
##D 
##D camview.labels <- c("SF0", "SL0", "SU0", "TV0")
##D names(camview.labels) <- c("RGB_Side_Far_0", "RGB_Side_Lower_0", 
##D                            "RGB_Side_Upper_0", "RGB_TV_0")
##D raw.19.dat <- suppressWarnings(importExcel(file = "./data/raw19datarow.csv",
##D                                            cartId = "Snapshot.ID.Tags",
##D                                            startTime = "06/10/2017 0:00 AM",
##D                                            timeFormat = "%d/%m/%Y %H:M", 
##D                                            labsCamerasViews = camview.labels, 
##D                                            imagetimesPlot = FALSE))
## End(Not run)


