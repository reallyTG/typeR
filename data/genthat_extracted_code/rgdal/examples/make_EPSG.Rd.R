library(rgdal)


### Name: make_EPSG
### Title: Make a data frame of EPSG projection codes
### Aliases: make_EPSG
### Keywords: spatial

### ** Examples

EPSG <- make_EPSG()
attr(EPSG, "metadata") # PROJ.4 5.0.0 and later include EPSG version
EPSG[grep("Oslo", EPSG$note), 1:2]
EPSG[1925:1927, 3]
EPSG[grep("Poland", EPSG$note), 1:2]
EPSG[grep("Amersfoort", EPSG$note), 1:2]
EPSG[grep("North Carolina", EPSG$note), 1:2]
EPSG[2202, 3]



